page_screen_output(0);
page_output_immediately(1); % to force printing directly 

output_file = '_post_process_result.txt';
fileID = fopen(output_file, 'w');

% Define the folders to process (change this to how many runs you completed)
folders = {'run1', 'run2', 'run3', 'run4'};

for i = 1:length(folders)
    folder_name = folders{i};
    fprintf('Processing %s...\n', folder_name);

    % Construct paths to the files inside each folder
    dl_rx_file   = fullfile(folder_name, 'DlRlcStats.txt');
    ul_rx_file   = fullfile(folder_name, 'UlRlcStats.txt');
    dl_sinr_file = fullfile(folder_name, 'DlRsrpSinrStats.txt');
    ul_sinr_file = fullfile(folder_name, 'UlSinrStats.txt');

    % 1. DL Throughput (RxBytes is the 10th column)
    fprintf('  Loading DL Throughput...\n'); fflush(stdout);
    DlRxBytes = load(dl_rx_file)(:,10);
    DlAverageThroughputKbps = sum(DlRxBytes) * 8 / 1000 / 50; % assumption here is simTime=50sec (change this if needed)

    % 2. UL Throughput (RxBytes is the 10th column)
    fprintf('  Loading UL Throughput...\n'); fflush(stdout);
    UlRxBytes = load(ul_rx_file)(:,10);
    UlAverageThroughputKbps = sum(UlRxBytes) * 8 / 1000 / 50;

    % 3. DL SINR (Sinr is the 6th column)
    fprintf('  Loading DL SINR...\n'); fflush(stdout);
    DlSinr = load(dl_sinr_file)(:,6);
    DlSinr(isnan(DlSinr)) = 0; % eliminate NaN values
    DlAverageSinrDb = 10 * log10(mean(DlSinr)); % convert to dB

    % 4. UL SINR (Sinr is the 5th column)
    fprintf('  Loading UL SINR...\n'); fflush(stdout);
    UlSinr = load(ul_sinr_file)(:,5);
    UlSinr(isnan(UlSinr)) = 0; % eliminate NaN values
    UlAverageSinrDb = 10 * log10(mean(UlSinr)); % convert to dB

    % Save results inside the respective run folder
    fprintf('  Saving results...\n'); fflush(stdout);


    fprintf(fileID, "=== Simulation Metrics Result (%s) ===\n", folder_name);
    fprintf(fileID, "DL Average Throughput: %.2f Kbps\n", DlAverageThroughputKbps);
    fprintf(fileID, "UL Average Throughput: %.2f Kbps\n", UlAverageThroughputKbps);
    fprintf(fileID, "DL Average SINR:       %.2f dB\n", DlAverageSinrDb);
    fprintf(fileID, "UL Average SINR:       %.2f dB\n", UlAverageSinrDb);

    fprintf('%s finished!\n', folder_name);
end

fclose(fileID);
fprintf('All runs processed successfully!\n');

