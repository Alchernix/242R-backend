CREATE TABLE `students` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `admission_year` INT NOT NULL,
    `major` VARCHAR(20) NOT NULL,
    `individual_number` INT NOT NULL,
    `phone_number` INT NOT NULL,
    `address` VARCHAR(50) NOT NULL,
    `cumulative_credit` INT NOT NULL DEFAULT 0,
    `average_credit` DOUBLE NOT NULL DEFAULT 0.0,
    `is_enrolled` TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`),
)ENGINE=InnoDB DEFAULT CHARSET=utf8;