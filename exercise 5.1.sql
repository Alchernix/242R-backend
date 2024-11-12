SELECT `id`, `c3`, `c5` FROM `crud` WHERE `c1` = 11 AND `c2` = 2; #1
SELECT * from `crud` WHERE `c1` > 18 OR `c2` < 2; #2
INSERT INTO `crud` (`c1`, `c2`, `c3`, `c5`) VALUES (7, 4, "col101", 0); #3
INSERT INTO `crud` VALUES(103, 3, 3, "col103", DEFAULT, 1); #4
SELECT * from `crud` WHERE `id` > 100; #5
UPDATE `crud` SET `c3` = "col0", `c5` = 0 WHERE `c1` > 4 AND `c1` < 9 AND `c2` = 1; #6
SELECT * FROM `crud` WHERE `c1` > 4 AND `c1` < 9 AND `c2` = 1; #7
DELETE FROM `crud` WHERE `c5` = 0; #8
SELECT * FROM `crud` WHERE `c5` = 0; #9