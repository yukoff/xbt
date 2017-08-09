# XBT BitTorrent Tracker

Author: olafvdspek

Original sources: [Google Code Archive](https://code.google.com/archive/p/xbt/)

TorrentPier and IPv6 support by: alex14n for nnm-club

Database schema: [GitHub](https://github.com/hurtom/toloka/blob/7c365ff3229cf659b12aa074a42a4a5cdcce7cda/install/sql/toloka_old.sql)

## Additional features

* account parking
* anti-cheating
* VIP
* extended download stats

## Building

### Prerequisites
* cmake
* gcc/g++
* boost
* libmysqlclient-dev
* make
* zlib1g

### Building on linux
```shell
cd xbt/Tracker
cmake .
make
```

Optionally copy default config
```shell
cp xbt_tracker.conf.default xbt_tracker.conf
```
