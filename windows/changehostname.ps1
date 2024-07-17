#Get computer name of device
$CN = hostname

#Set a prefix for device hostname
$prefix = "MeeaeH-W-"

#Get device serial number
$serial = (Get-WmiObject win32_bios).serialnumber

#New computer name
$computername = $prefix + $serial

if ($CN  -ne $computername) {
    #Rename computer name
    Rename-Computer -NewName $computername -Force -ErrorAction SilentlyContinue

    Write-Output "Computer name changed to $computername"
}
else
{
    Write-Output "No change to computer name required"
}

