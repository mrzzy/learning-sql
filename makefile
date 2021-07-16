#
# learning-sql
# project makefile
#

# program aliases
MYSQL:=mysql
CURL:=curl
TAR:=tar

# path
SAKILA_DIR?=/tmp/sakila-db

# MySql connection parameters
# target host & port mysql to connect to
MYSQL_HOST?=localhost
MYSQL_PORT?=3306
# protocol used to communicate with mysql
MYSQL_PROTOCOL?=tcp
# mysql database to use. This should be 'sakila' when completin exercises.
MYSQL_DATABASE?=sakila
# user credentials to use to authenticate with MySQL.
MYSQL_USER?=mariadb
MYSQL_PASSWORD?=mariadb-password

# shorthand for running mysql client with connection params
MYSQL_RUN:=$(MYSQL) --host=$(MYSQL_HOST) --port=$(MYSQL_PORT) \
	--user=$(MYSQL_USER) \
	--protocol=$(MYSQL_PROTOCOL) \
	--password=$(MYSQL_PASSWORD)

.PHONY: download-sakila init-sakila

download-sakila: $(SAKILA_DIR)

$(SAKILA_DIR):
	$(CURL) -k https://downloads.mysql.com/docs/sakila-db.tar.gz -o $(SAKILA_DIR).tgz
	$(TAR) -C $(dir $(SAKILA_DIR)) -xzvf $(SAKILA_DIR).tgz

load-sakila: $(SAKILA_DIR)
	$(MYSQL_RUN) < $(SAKILA_DIR)/sakila-schema.sql
	$(MYSQL_RUN) < $(SAKILA_DIR)/sakila-data.sql
