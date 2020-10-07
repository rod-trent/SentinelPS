[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[xml]$XmlDocument = Invoke-WebRequest -Uri "https://isc.sans.edu/api/threatlist/shodan"
$XmlDocument.threatlist.shodan.ipv4 | Out-File "c:\feeds\RootShodanIP.txt"