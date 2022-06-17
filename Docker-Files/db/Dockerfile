FROM mysql:5.7.25
LABEL "Project"="Eereeda"
LABEL "Author"="Meraj"

ENV MYSQL_ROOT_PASSWORD:"eereedapass"
ENV MYSQL_DATABASE:"accounts"

ADD db_backup.sql docker-entrypoint-initdb.d/db_backup.sql