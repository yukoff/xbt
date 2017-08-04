UPDATE `bb_bt_users` u
SET
`u_bonus_hourly` = ( (
	SELECT bonus_sum
		FROM (
			SELECT user_id, SUM(time_bonus + size_bonus + seeders_bonus) * 5 AS bonus_sum
			FROM (
				SELECT user_id, TIMESTAMPDIFF(MONTH, FROM_UNIXTIME(reg_time), NOW()) * 0.01 AS time_bonus,

				CASE
				WHEN size/1073741824 <= 1 THEN 0
				WHEN size/1073741824 > 1 AND size/1073741824 <= 3 THEN 0.2
				WHEN size/1073741824 > 3 AND size/1073741824 <= 6 THEN 0.3
				WHEN size/1073741824 > 6 AND size/1073741824 <= 10 THEN 0.4
				WHEN size/1073741824 > 10 AND size/1073741824 <= 20 THEN 0.5
				WHEN size/1073741824 > 20 THEN 0.6
				END AS size_bonus,

				CASE
				WHEN seeders <= 10 THEN 0.2
				WHEN seeders > 10 THEN 0.1
				END AS seeders_bonus

				FROM (
					SELECT t.user_id, tor.torrent_id, tor.reg_time, tor.size, tor.seeders FROM bb_bt_tracker t, bb_bt_torrents tor
					WHERE tor.torrent_id = t.torrent_id
					AND t.seeder = 1
				) AS FIRST
			) AS SECOND
		GROUP BY user_id
		) AS THIRD
	WHERE user_id = u.user_id
)
* 1048576 # megabytes from bonus_sum to bytes
);

UPDATE `bb_bt_users` u
SET
`u_bonus_total` = ( `u_bonus_total` + `u_bonus_hourly` ),
`u_bonus_today` = ( `u_bonus_today` + `u_bonus_hourly` );
