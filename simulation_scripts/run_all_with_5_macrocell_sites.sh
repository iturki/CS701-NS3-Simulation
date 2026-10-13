#!/bin/bash

# A simulation run where macrocell sites were decreased from 7 sites to 5 sites.
# You may add --generateRem=1  to the below commands to generate the rem file

# NoOpHandoverAlgorithm :: nMacroEnbSites=5

OUTPUT_DIR1="_output/no-op-enb5/run1"
mkdir -p "$OUTPUT_DIR1"

echo "Running NoOpHandoverAlgorithm :: nMacroEnbSites=5"

./ns3 run "modified-lena-dual-stripe \
  --simTime=50 --nBlocks=0 --nMacroEnbSites=5 --nMacroEnbSitesX=2 \
  --epc=1 --useUdp=0 --outdoorUeMinSpeed=16.6666 --outdoorUeMaxSpeed=16.6666 \
  --ns3::LteHelper::HandoverAlgorithm=ns3::NoOpHandoverAlgorithm \
  --ns3::RadioBearerStatsCalculator::DlRlcOutputFilename=DlRlcStats.txt \
  --ns3::RadioBearerStatsCalculator::UlRlcOutputFilename=UlRlcStats.txt \
  --ns3::PhyStatsCalculator::DlRsrpSinrFilename=DlRsrpSinrStats.txt \
  --ns3::PhyStatsCalculator::UlSinrFilename=UlSinrStats.txt \
  --RngRun=1" > "${OUTPUT_DIR1}/no-op.txt"

# Finds all .txt files in root folder, excludes "CMakeLists.txt", and moves the rest to run folder
find . -maxdepth 1 \( -name "*.txt" -o -name "*.rem" \) ! -name "CMakeLists.txt" -exec mv {} "${OUTPUT_DIR1}/" \;

# A2A4RsrqHandoverAlgorithm :: nMacroEnbSites=5

OUTPUT_DIR2="_output/a2-a4-rsrq-enb5/run1"
mkdir -p "$OUTPUT_DIR2"

echo "Running A2A4RsrqHandoverAlgorithm :: nMacroEnbSites=5"

./ns3 run "modified-lena-dual-stripe \
  --simTime=50 --nBlocks=0 --nMacroEnbSites=5 --nMacroEnbSitesX=2 \
  --epc=1 --useUdp=0 --outdoorUeMinSpeed=16.6666 --outdoorUeMaxSpeed=16.6666 \
  --ns3::LteHelper::HandoverAlgorithm=ns3::A2A4RsrqHandoverAlgorithm \
  --ns3::RadioBearerStatsCalculator::DlRlcOutputFilename=DlRlcStats.txt \
  --ns3::RadioBearerStatsCalculator::UlRlcOutputFilename=UlRlcStats.txt \
  --ns3::PhyStatsCalculator::DlRsrpSinrFilename=DlRsrpSinrStats.txt \
  --ns3::PhyStatsCalculator::UlSinrFilename=UlSinrStats.txt \
  --RngRun=1" > "${OUTPUT_DIR2}/a2-a4-rsrq.txt"

# Finds all .txt files in root folder, excludes "CMakeLists.txt", and moves the rest to run folder
find . -maxdepth 1 \( -name "*.txt" -o -name "*.rem" \) ! -name "CMakeLists.txt" -exec mv {} "${OUTPUT_DIR2}/" \;

# A3RsrpHandoverAlgorithm :: nMacroEnbSites=5

OUTPUT_DIR3="_output/a3-rsrp-enb5/run1"
mkdir -p "$OUTPUT_DIR3"

echo "Running A3RsrpHandoverAlgorithm :: nMacroEnbSites=5"

./ns3 run "modified-lena-dual-stripe \
  --simTime=50 --nBlocks=0 --nMacroEnbSites=5 --nMacroEnbSitesX=2 \
  --epc=1 --useUdp=0 --outdoorUeMinSpeed=16.6666 --outdoorUeMaxSpeed=16.6666 \
  --ns3::LteHelper::HandoverAlgorithm=ns3::A3RsrpHandoverAlgorithm \
  --ns3::RadioBearerStatsCalculator::DlRlcOutputFilename=DlRlcStats.txt \
  --ns3::RadioBearerStatsCalculator::UlRlcOutputFilename=UlRlcStats.txt \
  --ns3::PhyStatsCalculator::DlRsrpSinrFilename=DlRsrpSinrStats.txt \
  --ns3::PhyStatsCalculator::UlSinrFilename=UlSinrStats.txt \
  --RngRun=1" > "${OUTPUT_DIR3}/a3-rsrp.txt"

# Finds all .txt files in root folder, excludes "CMakeLists.txt", and moves the rest to run folder
find . -maxdepth 1 \( -name "*.txt" -o -name "*.rem" \) ! -name "CMakeLists.txt" -exec mv {} "${OUTPUT_DIR3}/" \;

