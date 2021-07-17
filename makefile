#
# learning-sql
# project makefile
#

# program aliases
MYSQL:=mysql
CURL:=curl
TAR:=tar

# path aliases
SAKILA_DIR?=/tmp/sakila-db
# exercise SQL files as defined as any '.sql' with a 'exercise' prefix
EXERCISE_SQLS:=$(shell find -type f -name 'exercise*.sql')

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
	--password=$(MYSQL_PASSWORD) \
	--protocol=$(MYSQL_PROTOCOL) \


.PHONY: download-sakila load-sakila sakila-data sakila-schema run $(RUN_EXERCISES) \
	debug

.DEFAULT: run

# section: targets to run & debug exercises
RUN_EXERCISES:=$(foreach SQL,$(EXERCISE_SQLS),run/$(SQL))

run: $(RUN_EXERCISES)

run/%.sql: %.sql
	@(echo "============[$@]============"; $(MYSQL_RUN) --table sakila < $< )

# 'debug/%' adds to the 'run/%' target by providing scrollable output for easiler debugging.
debug/%.sql: %.sql
	@(echo "============[$@]============"; $(MYSQL_RUN) --table sakila < $< ) 2>&1 | less

# section: targets to download, load the Sakila database
download-sakila: $(SAKILA_DIR)

$(SAKILA_DIR):
	$(CURL) -k https://downloads.mysql.com/docs/sakila-db.tar.gz -o $(SAKILA_DIR).tgz
	$(TAR) -C $(dir $(SAKILA_DIR)) -xzvf $(SAKILA_DIR).tgz

load-sakila: sakila-schema sakila-data

sakila-schema: $(SAKILA_DIR)
	@$(MYSQL_RUN) < $(SAKILA_DIR)/sakila-schema.sql

sakila-data: $(SAKILA_DIR)
	@$(MYSQL_RUN) < $(SAKILA_DIR)/sakila-data.sql
