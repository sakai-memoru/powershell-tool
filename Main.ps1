# commandline parameter
param (
  [string]$module_name = 'module_samples'
)

./Initialize-Project.ps1 $module_name
./Invoke-Npm.ps1
