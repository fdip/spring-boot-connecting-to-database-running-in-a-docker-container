FROM mysql
MAINTAINER Raghu <raghu at pioneerlabs dot io>

COPY /activiti-sql/activiti.mysql.create.engine.sql /docker-entrypoint-initdb.d/activiti.mysql.create.engine.sql
COPY /activiti-sql/activiti.mysql.create.history.sql /docker-entrypoint-initdb.d/activiti.mysql.create.history.sql
COPY /activiti-sql/activiti.mysql.create.identity.sql /docker-entrypoint-initdb.d/activiti.mysql.create.identity.sql

