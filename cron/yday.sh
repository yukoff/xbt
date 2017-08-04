#!/bin/sh

cd /etc/xbt/cron

mysql db <yday.sql 1>yday1.log 2>yday2.log
