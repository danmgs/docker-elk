# Purpose: script to delete data for ELK.
# Usage: powershell delete-elk-data.ps1 -type <type> where type is either : E, L, K, ALL.
# E   : will delete the /elasticsearch/data
# L   : will delete the /logstash/data
# K   : will delete the /kibana/data
# ALL : will delete all the ELK datas

Param([parameter(Mandatory=$true,
   HelpMessage="Enter type to delete, options -type <type>  (E / L / K / ALL)")]
   $type)

write-output "Entered $type"

If ($type -eq "E") {
   write-output "Deleting /elasticsearch/data..."
   Remove-Item ./elasticsearch/data -Confirm:$false -Force
}
ElseIf ($type -eq "L") {
   write-output "Deleting /logstash/data..."
   Remove-Item ./logstash/data -Confirm:$false -Force
}
ElseIf ($type -eq "K") {
   write-output "Deleting /kibana/data..."
   Remove-Item ./kibana/data -Confirm:$false -Force
}
ElseIf ($type -eq "ALL") {
   write-output "Deleting all the ELK datas..."
   Remove-Item ./elasticsearch/data -Confirm:$false -Force
   Remove-Item ./logstash/data -Confirm:$false -Force
   Remove-Item ./kibana/data -Confirm:$false -Force
}