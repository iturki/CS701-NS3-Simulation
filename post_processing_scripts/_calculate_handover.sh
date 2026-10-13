#!/usr/bin/env bash

# Input file
FILENAME="a3-rsrp.txt" # adjust the file name according to the algorithm being calculated
# Output file
OUTPUT_FILE="calculate_handover_results.txt"


printf "%-10s %-18s %-25s\n" "Run" "Total Handovers" "HO per UE per sec" > "$OUTPUT_FILE"

# Loop through run1 to run4 directories. Remove he loop if you are only doing one run
for i in {1..4}; do
    RUN_DIR="run$i"
    TARGET_FILE="$RUN_DIR/$FILENAME"

    if [[ -f "$TARGET_FILE" ]]; then
        HO_COUNT=$(grep "Handover" "$TARGET_FILE" | wc -l)
        
        # Calculate HO rate with UEs (48) and SIM_TIME (50) hardcoded directly in awk
        HO_PER_UE_PER_SEC=$(awk -v ho="$HO_COUNT" 'BEGIN { printf "%.6f", ho / (48 * 50) }')

        printf "%-10s %-18d %-25s\n" "run$i" "$HO_COUNT" "$HO_PER_UE_PER_SEC" >> "$OUTPUT_FILE"
    fi
done

echo "Statistics generated in $OUTPUT_FILE"
cat "$OUTPUT_FILE"