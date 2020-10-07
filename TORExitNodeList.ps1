$url = “https://check.torproject.org/cgi-bin/TorBulkExitList.py?ip=1.1.1.1”
$output = “c:\feeds\TORExitNodeList.txt”
Invoke-WebRequest -Uri $url -OutFile $output
$content = Get-Content $output