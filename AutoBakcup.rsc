:local date ([:pick [/system clock get date] 0 3] ."_". [:pick [/system clock get date] 4 6] ."_". [:pick [/system clock get date] 7 11]);
:local time ([:pick [/system clock get time] 0 2]."_".[:pick [/system clock get time] 3 5]);
:local sysname [/system identity get name];
:local textfilename ($"sysname"."_".$"date"."_".$"time");
:local toemail "zarbinco@yahoo.com";
:local fromemail "decat.router@gmail.com";
:local emailserver "smtp.gmail.com";
:global service "Mikrotik_Backup_RUN";
:global ball "\F0\9F\94\B5";
:if ([:len [/file find name~sysname]] > 0) do={
/file remove [find name~sysname];
:log info "Run Backup";
/export file=$"textfilename";
:delay 2s;
:log info "Emailing backups";
/tool e-mail send to=$"toemail" from=$"fromemail" server=$"emailserver" port=587 subject="$sysname Mikrotik [Config Backup]" body="Mikrotik $sysname Backup on date: $date and time: $time" file=$"textfilename"
} else={
:log info "Run Backup";
/export file=$"textfilename";
:delay 2s;
:log info "Emailing backups";
/tool e-mail send to=$"toemail" from=$"fromemail" server=$"emailserver" port=587 subject="$sysname Mikrotik [Config Backup]" body="Mikrotik $sysname Backup on date: $date and time: $time" file=$"textfilename"
}