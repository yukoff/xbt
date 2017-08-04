UPDATE bb_bt_torrents tor
LEFT JOIN bb_bt_users_dl_status s ON tor.topic_id = s.topic_id
LEFT JOIN bb_topics t ON tor.topic_id = t.topic_id
SET tor.complete_count = (SELECT COUNT(*) FROM bb_bt_users_dl_status WHERE topic_id = tor.topic_id)
WHERE t.topic_type_gold != 4
