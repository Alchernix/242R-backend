-- 1. ID가11인노선을예매한모든승객의ID(id),이름(name),좌석번호(seat_number)를좌석번호의오름차순
-- 으로조회
SELECT `users`.`id`, `users`.`name`, `tickets`.`seat_number` FROM `users` INNER JOIN `tickets`
ON `users`.`id` = `tickets`.`user` WHERE `tickets`.`train` = 11 ORDER BY `tickets`.`seat_number`;
-- 2. 각사용자의ID(id),이름(name), 탑승열차수(trains_count), 총거리(total_distance)를총거리의내림
-- 차순으로상위6명만조회
SELECT `users`.`id`, `users`.`name`, Count(*) AS `trains_count`, Sum(`trains`.`distance`) / 10 AS `total_distance`
FROM `users` INNER JOIN `tickets`ON `users`.`id` = `tickets`.`user`
INNER JOIN `trains` ON `tickets`.`train` = `trains`.`id`
GROUP BY `tickets`.`user`
ORDER BY `total_distance` DESC LIMIT 6;
-- 3. 각노선의ID(id),열차종류(type),출발역(src_stn),도착역(dst_stn),여행시간(travel_time)을여행시
-- 간의내림차순으로상위6개만조회
SELECT `trains`.`id`, `types`.`name`, `src`.`name` AS `src_stn`, `dst`.`name` AS `dst_stn`, Timediff(`trains`.`arrival`, `trains`.`departure`) AS `travel_time`
FROM `trains` INNER JOIN `types` ON `trains`.`type` = `types`.`id`
INNER JOIN `stations` AS `src` ON `trains`.`source` = `src`.`id`
INNER JOIN `stations` AS `dst` ON `trains`.`destination` = `dst`.`id`
ORDER BY `travel_time` DESC LIMIT 6;
-- 4. 각노선의열차종류(type),출발역(src_stn),도착역(dst_stn),출발시각(departure),도착시각(arrival),
-- 운임(fare;원단위)을출발시각의오름차순으로모두조회
SELECT `types`.`name`, `src`.`name` AS `src_stn`, `dst`.`name` AS `dst_stn`, `trains`.`departure`, `trains`.`arrival`, Round(`types`.`fare_rate` * `trains`.`distance` / 1000, -2) AS `fare`
FROM `trains` INNER JOIN `types` ON `trains`.`type` = `types`.`id`
INNER JOIN `stations` AS `src` ON `trains`.`source` = `src`.`id`
INNER JOIN `stations` AS `dst` ON `trains`.`destination` = `dst`.`id`
ORDER BY `trains`.`departure`;
-- 5. 각노선의ID(id),열차종류(type),출발역(src_stn),도착역(dst_stn),예매된좌석수(occupied),최대좌석
-- 수(maximum)를노선의ID의오름차순으로모두조회(예매한사용자가없는노선은제외)
SELECT `trains`.`id`, `types`.`name`, `src`.`name` AS `src_stn`, `dst`.`name` AS `dst_stn`, Count(*) AS `occupied`, `types`.`max_seats` AS `maximum`
FROM `trains` INNER JOIN `types` ON `trains`.`type` = `types`.`id`
INNER JOIN `stations` AS `src` ON `trains`.`source` = `src`.`id`
INNER JOIN `stations` AS `dst` ON `trains`.`destination` = `dst`.`id`
INNER JOIN `tickets` ON `trains`.`id` = `tickets`.`train`
GROUP BY `tickets`.`train`
ORDER BY `trains`.`id`;
--  6. 각노선의ID(id),열차종류(type),출발역(src_stn),도착역(dst_stn),예매된좌석수(occupied),최대좌석
-- 수(maximum)를노선의ID의오름차순으로모두조회(예매한사용자가없는노선도포함)
SELECT `trains`.`id`, `types`.`name`, `src`.`name` AS `src_stn`, `dst`.`name` AS `dst_stn`, Count(`tickets`.`id`) AS `occupied`, `types`.`max_seats` AS `maximum`
FROM `trains` INNER JOIN `types` ON `trains`.`type` = `types`.`id`
INNER JOIN `stations` AS `src` ON `trains`.`source` = `src`.`id`
INNER JOIN `stations` AS `dst` ON `trains`.`destination` = `dst`.`id`
LEFT OUTER JOIN `tickets` ON `trains`.`id` = `tickets`.`train`
GROUP BY `tickets`.`train`
ORDER BY `trains`.`id`;