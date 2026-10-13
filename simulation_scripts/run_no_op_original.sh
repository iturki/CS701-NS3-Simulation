#!/bin/bash

for run in {1..4}
do
    OUTPUT_DIR="_output/no-op/run${run}"
    mkdir -p "$OUTPUT_DIR"
    
    echo "Running NoOpHandoverAlgorithm simulation with RngRun=${run}..."
 
    # You may add --generateRem=1  to the below command to generate the rem file
    ./ns3 run "modified-lena-dual-stripe \
    --simTime=50 --nBlocks=0 --nMacroEnbSites=7 --nMacroEnbSitesX=2 \
    --epc=1 --useUdp=0 --outdoorUeMinSpeed=16.6667 --outdoorUeMaxSpeed=16.6667 \
    --ns3::LteHelper::HandoverAlgorithm=ns3::NoOpHandoverAlgorithm \
    --ns3::RadioBearerStatsCalculator::DlRlcOutputFilename=DlRlcStats.txt \
    --ns3::RadioBearerStatsCalculator::UlRlcOutputFilename=UlRlcStats.txt \
    --ns3::PhyStatsCalculator::DlRsrpSinrFilename=DlRsrpSinrStats.txt \
    --ns3::PhyStatsCalculator::UlSinrFilename=UlSinrStats.txt \
    --RngRun=${run}" > "${OUTPUT_DIR}/no-op.txt"
    
    # Finds all .txt files in root folder, excludes "CMakeLists.txt", and moves the rest to run folder
    find . -maxdepth 1 -name "*.txt" ! -name "CMakeLists.txt" -exec mv {} ${OUTPUT_DIR}/ \;
    
done
echo "All NoOpHandoverAlgorithm simulations complete!"
