# commandline parameter
param (
  [string]$module_name = 'module_samples'
)

./pscript/Initialize-Project.ps1 $module_name
./pscript/Invoke-Npm.ps1
