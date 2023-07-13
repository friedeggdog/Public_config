DATE=`date +"%d_%b_%Y"`
SQLFILE=/var/backup/db/db_backup_${DATE}.sql
DATABASE=students
USER=root
PASSWORD=1234

mysqldump -u ${USER} -p${PASSWORD} ${DATABASE}|gzip > ${SQLFILE}.gz
