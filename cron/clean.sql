delete
-- select count(*)
from bb_bt_tracker
where expire_time < unix_timestamp() - 300;

-- delete from bb_sessions
-- where session_time < unix_timestamp() - 3600;

-- INSERT IGNORE INTO bb_bt_users_ip (peer_id, user_id, ip, timestamp)
-- SELECT DISTINCT peer_id, user_id, ip, UNIX_TIMESTAMP()
-- FROM bb_bt_tracker;

exit
