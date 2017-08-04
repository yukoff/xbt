#!/bin/sh

cd /etc/xbt/cron

mysql db <clean.sql 1>clean1.log 2>clean2.log
