FROM mysql:5.7.25
LABEL "Project"="Eereeda"
LABEL "Author"="Meraj"

ENV MYSQL_ROOT_PASSWORD:"vpropass"
ENV MYSQL_DATABASE:"accounts"

ADD db_backup.sql docker-entrypoint-init.d/db_backup.sql