#!/bin/bash
if [ $(id -u) != "0" ]
then
  sudo "$0" "$@"  # Modified as suggested below.
  exit $?
fi

echo "Backup server files, please wait..."

BACKUPTIME=`date +%Y-%m-%d_%H%M%S`
DESTINATION=/srv/backups/backup-$BACKUPTIME.tar.gz
SOURCEFOLDER=/srv
tar --absolute-names --exclude=/srv/backups -cpzf $DESTINATION $SOURCEFOLDER
chown -R vanegmond:vanegmond /srv/backups

echo "Done!"