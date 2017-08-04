#!/bin/sh

cd /etc/xbt/cron

mysql db <hourly_bonus.sql 1>hourly_bonus.log 2>hourly_bonus2.log
