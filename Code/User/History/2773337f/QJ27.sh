DATE=`date +"%d_%b_%Y_%H%M"
SQLFILE=/var/backup/db/db_backup_${DATE}.sql
DATABASE=students
USER=root
PASSWORD=1234

mysqldump -u ${USER} -p${PASSWORD} ${DATABASE}|gzip > ${SQLFILE}.gz
find /var/backup/db/. -mtime +7 -exec rm {} \;