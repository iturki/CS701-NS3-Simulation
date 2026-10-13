#!/bin/bash

# A simulation run where macrocells' inter-site distance was increased from 500m to 3000m, while keeping the same number of UEs.
# You may add --generateRem=1  to the below commands to generate the rem file

OUTPUT_DIR4="_output/no-op-sd3000/run1"
mkdir -p "$OUTPUT_DIR4"

# NoOpHandoverAlgorithm :: interSiteDistance=3000 
echo "Running NoOpHandoverAlgorithm :: interSiteDistance=3000"

./ns3 run "modified-lena-dual-stripe \
  --simTime=50 --nBlocks=0 --nMacroEnbSites=7 --nMacroEnbSitesX=2 --interSiteDistance=3000 --macroUeDensity=0.0000005566 \
  --epc=1 --useUdp=0 --outdoorUeMinSpeed=16.6666 --outdoorUeMaxSpeed=16.6666 \
  --ns3::LteHelper::HandoverAlgorithm=ns3::NoOpHandoverAlgorithm \
  --ns3::RadioBearerStatsCalculator::DlRlcOutputFilename=DlRlcStats.txt \
  --ns3::RadioBearerStatsCalculator::UlRlcOutputFilename=UlRlcStats.txt \
  --ns3::PhyStatsCalculator::DlRsrpSinrFilename=DlRsrpSinrStats.txt \
  --ns3::PhyStatsCalculator::UlSinrFilename=UlSinrStats.txt \
  --RngRun=1" > "${OUTPUT_DIR4}/no-op.txt"

# Finds all .txt files in root folder, excludes "CMakeLists.txt", and moves the rest to run folder
find . -maxdepth 1 \( -name "*.txt" -o -name "*.rem" \) ! -name "CMakeLists.txt" -exec mv {} "${OUTPUT_DIR4}/" \;

# A2A4RsrqHandoverAlgorithm :: interSiteDistance=3000 

OUTPUT_DIR5="_output/a2-a4-rsrq-sd3000/run1"
mkdir -p "$OUTPUT_DIR5"

echo "Running A2A4RsrqHandoverAlgorithm ::interSiteDistance=3000"

./ns3 run "modified-lena-dual-stripe \
  --simTime=50 --nBlocks=0 --nMacroEnbSites=7 --nMacroEnbSitesX=2 --interSiteDistance=3000 --macroUeDensity=0.0000005566 \
  --epc=1 --useUdp=0 --outdoorUeMinSpeed=16.6666 --outdoorUeMaxSpeed=16.6666 \
  --ns3::LteHelper::HandoverAlgorithm=ns3::A2A4RsrqHandoverAlgorithm \
  --ns3::RadioBearerStatsCalculator::DlRlcOutputFilename=DlRlcStats.txt \
  --ns3::RadioBearerStatsCalculator::UlRlcOutputFilename=UlRlcStats.txt \
  --ns3::PhyStatsCalculator::DlRsrpSinrFilename=DlRsrpSinrStats.txt \
  --ns3::PhyStatsCalculator::UlSinrFilename=UlSinrStats.txt \
  --RngRun=1" > "${OUTPUT_DIR5}/a2-a4-rsrq.txt"

# Finds all .txt files in root folder, excludes "CMakeLists.txt", and moves the rest to run folder
find . -maxdepth 1 \( -name "*.txt" -o -name "*.rem" \) ! -name "CMakeLists.txt" -exec mv {} "${OUTPUT_DIR5}/" \;

# A3RsrpHandoverAlgorithm :: interSiteDistance=3000

OUTPUT_DIR6="_output/a3-rsrp-sd3000/run1"
mkdir -p "$OUTPUT_DIR6"

echo "Running A3RsrpHandoverAlgorithm :: interSiteDistance=3000"

./ns3 run "modified-lena-dual-stripe \
  --simTime=50 --nBlocks=0 --nMacroEnbSites=7 --nMacroEnbSitesX=2 --interSiteDistance=3000 --macroUeDensity=0.0000005566 \
  --epc=1 --useUdp=0 --outdoorUeMinSpeed=16.6666 --outdoorUeMaxSpeed=16.6666 \
  --ns3::LteHelper::HandoverAlgorithm=ns3::A3RsrpHandoverAlgorithm \
  --ns3::RadioBearerStatsCalculator::DlRlcOutputFilename=DlRlcStats.txt \
  --ns3::RadioBearerStatsCalculator::UlRlcOutputFilename=UlRlcStats.txt \
  --ns3::PhyStatsCalculator::DlRsrpSinrFilename=DlRsrpSinrStats.txt \
  --ns3::PhyStatsCalculator::UlSinrFilename=UlSinrStats.txt \
  --RngRun=1" > "${OUTPUT_DIR6}/a3-rsrp.txt"
  
# Finds all .txt files in root folder, excludes "CMakeLists.txt", and moves the rest to run folder
find . -maxdepth 1 \( -name "*.txt" -o -name "*.rem" \) ! -name "CMakeLists.txt" -exec mv {} "${OUTPUT_DIR6}/" \;