$container = "local-ai-packaged-postgres-1"
$user = "root"
$db = "n8n"
$backupPath = "/var/lib/postgresql/data/backup.dump"
$localFile = "$HOME\Documents\postgres-backup-$(Get-Date -Format yyyyMMdd-HHmm).dump"

docker exec -t $container pg_dump -U $user -d $db -F c -b -v -f $backupPath
docker cp "$container:$backupPath" $localFile
Write-Output "✅ Backup saved to $localFile"
