#!/bin/bash

# A simulation run where UEs speed is increased to 120km/h
# You may add --generateRem=1  to the below commands to generate the rem file

for run in {1..4}
do
  OUTPUT_DIR="_output/a2-a4-rsrq-sp120/run${run}"
  mkdir -p "$OUTPUT_DIR"

  echo "Running A2A4RsrqHandoverAlgorithm simulation (Speed is 120km/h) with RngRun=${run}..."

  ./ns3 run "modified-lena-dual-stripe \
    --simTime=50 --nBlocks=0 --nMacroEnbSites=7 --nMacroEnbSitesX=2 \
    --epc=1 --useUdp=0 --outdoorUeMinSpeed=33.3333 --outdoorUeMaxSpeed=33.3333 \
    --ns3::LteHelper::HandoverAlgorithm=ns3::A2A4RsrqHandoverAlgorithm \
    --ns3::RadioBearerStatsCalculator::DlRlcOutputFilename=DlRlcStats.txt \
    --ns3::RadioBearerStatsCalculator::UlRlcOutputFilename=UlRlcStats.txt \
    --ns3::PhyStatsCalculator::DlRsrpSinrFilename=DlRsrpSinrStats.txt \
    --ns3::PhyStatsCalculator::UlSinrFilename=UlSinrStats.txt \
    --RngRun=${run}" > "${OUTPUT_DIR}/a2-a4-rsrq.txt"

  
	# Finds all .txt files in root folder, excludes "CMakeLists.txt", and moves the rest to run folder
	find . -maxdepth 1 \( -name "*.txt" -o -name "*.rem" \) ! -name "CMakeLists.txt" -exec mv {} "${OUTPUT_DIR}/" \;

done
echo "All A2A4RsrqHandoverAlgorithm simulations complete!"



for run in {1..4}
do
  OUTPUT_DIR2="_output/no-op-sp120/run${run}"
  mkdir -p "$OUTPUT_DIR2"

  echo "Running NoOpHandoverAlgorithm simulation (Speed is 120km/h) with RngRun=${run}..."

  ./ns3 run "modified-lena-dual-stripe \
    --simTime=50 --nBlocks=0 --nMacroEnbSites=7 --nMacroEnbSitesX=2 \
    --epc=1 --useUdp=0 --outdoorUeMinSpeed=33.3333 --outdoorUeMaxSpeed=33.3333 \
    --ns3::LteHelper::HandoverAlgorithm=ns3::NoOpHandoverAlgorithm \
    --ns3::RadioBearerStatsCalculator::DlRlcOutputFilename=DlRlcStats.txt \
    --ns3::RadioBearerStatsCalculator::UlRlcOutputFilename=UlRlcStats.txt \
    --ns3::PhyStatsCalculator::DlRsrpSinrFilename=DlRsrpSinrStats.txt \
    --ns3::PhyStatsCalculator::UlSinrFilename=UlSinrStats.txt \
    --RngRun=${run}" > "${OUTPUT_DIR2}/no-op.txt"

 
	# Finds all .txt files in root folder, excludes "CMakeLists.txt", and moves the rest to run folder
	find . -maxdepth 1 \( -name "*.txt" -o -name "*.rem" \) ! -name "CMakeLists.txt" -exec mv {} "${OUTPUT_DIR2}/" \;

done
echo "All NoOpHandoverAlgorithm simulations complete!"


for run in {1..4}
do
  OUTPUT_DIR="_output/a3-rsrp-sp120/run${run}"
  mkdir -p "$OUTPUT_DIR"

  echo "Running A3RsrpHandoverAlgorithm simulation (Speed is 120km/h) with RngRun=${run}..."

  ./ns3 run "modified-lena-dual-stripe \
    --simTime=50 --nBlocks=0 --nMacroEnbSites=7 --nMacroEnbSitesX=2 \
    --epc=1 --useUdp=0 --outdoorUeMinSpeed=33.3333 --outdoorUeMaxSpeed=33.3333 \
    --ns3::LteHelper::HandoverAlgorithm=ns3::A3RsrpHandoverAlgorithm \
    --ns3::RadioBearerStatsCalculator::DlRlcOutputFilename=DlRlcStats.txt \
    --ns3::RadioBearerStatsCalculator::UlRlcOutputFilename=UlRlcStats.txt \
    --ns3::PhyStatsCalculator::DlRsrpSinrFilename=DlRsrpSinrStats.txt \
    --ns3::PhyStatsCalculator::UlSinrFilename=UlSinrStats.txt \
    --RngRun=${run}" > "${OUTPUT_DIR}/a3-rsrp.txt"

  
  # Finds all .txt files in root folder, excludes "CMakeLists.txt", and moves the rest to run folder
    find . -maxdepth 1 -name "*.txt" ! -name "CMakeLists.txt" -exec mv {} ${OUTPUT_DIR}/ \;

done
echo "All A3RsrpHandoverAlgorithm simulations complete!"