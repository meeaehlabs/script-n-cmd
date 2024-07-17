#!/bin/sh
#Get computer name of device
CN=$(hostname)

echo "Current computer name is $CN"

#Set a prefix for device hostname
prefix='MeeaeH-M-'

#Get device serial number
Serial=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')

#New computer name
NCN="${prefix}${Serial}"

if [ "$NCN" != "$CN" ]; then
  echo "Computer name will be changed to $NCN"
  scutil --set ComputerName $NCN
  scutil --set LocalHostName $NCN
  scutil --set HostName $NCN
  dscacheutil -flushcache
else
  echo "No name change required to this computer"
fi
