#!/bin/sh

# Run chkrootkit
if chkrootkit | grep -q "Infected"; then
  echo "Threat detected by chkrootkit."
  exit 1
fi

# Run ClamAV
if clamscan -r / | grep -q "Infected"; then
  echo "Threat detected by ClamAV."
  exit 1
fi

# No threats detected
echo "System scan completed. No threats detected."
