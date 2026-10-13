# CS701-NS3-Simulation Handover Simulation

This repository contains the replication package for an ns-3 simulation assignment evaluating LTE handover algorithms (No-Op, A2-A4-RSRQ, A3-RSRP) using the `lena-dual-stripe` example. Everything needed to re-run the experiments and generate the exact summary statistics from the report is included.

## Contents

*   **`lte_example/`**: the modified `lena-dual-stripe` example.
*   **`simulation_scripts/`**: Scripts used to run the simulation in different scenarios.
*   **`_output/`**: The output raw data.
*   **`post_processing_scripts/`**: Scripts used to process the raw data and calculate averages (Throughput, SINR), handover counts, and plot REMs.

## How to Replicate
1.   Copy the modified .cc example to your ns-3 scratch directory.
2.   Pick a simulation from the `simulation_scripts/` folder.
3.   Review the parameters (and adjust what is needed) and execute the script.
4.   Use the post-processing scripts to extract statistics from the aw data generated in the previous step.


