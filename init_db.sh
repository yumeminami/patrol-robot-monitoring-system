#!/bin/bash

# 设置 MySQL 连接参数
MYSQL_USER="sample_user"
MYSQL_PASSWORD="sample_password"
MYSQL_DATABASE="sample_db"
MYSQL_SCRIPT="/docker-entrypoint-initdb.d/init_db.sql"

# 构建 MySQL 命令
MYSQL_CMD="mysql -u${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DATABASE} < ${MYSQL_SCRIPT}"


# 执行 MySQL 命令
docker exec -it db ${MYSQL_CMD}
