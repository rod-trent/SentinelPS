[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://talosintelligence.com/documents/ip-blacklist"
$output = "c:\feeds\Talos.txt"
Invoke-WebRequest -Uri $url -OutFile $output