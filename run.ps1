. { iwr -useb https://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force
Set-BoxStarterConfig -LocalRepo "C:\src\personal\lordldx-environment"
Invoke-BoxstarterBuild LordLdxEnvironment
Install-BoxstarterPackage LordLdxEnvironment