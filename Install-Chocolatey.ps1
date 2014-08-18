$wc=new-object net.webclient

$wp=[system.net.WebProxy]::GetDefaultProxy()

$wp.UseDefaultCredentials=$true

$wc.Proxy=$wp

iex ($wc.DownloadString('https://chocolatey.org/install.ps1'))