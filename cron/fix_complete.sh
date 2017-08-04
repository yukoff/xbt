#!/bin/sh

cd /etc/xbt/cron

mysql db <fix_complete.sql 1>fix_complete1.log 2>fix_complete2.log
