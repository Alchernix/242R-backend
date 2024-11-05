CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(20) NOT NULL,
    `user_password` VARCHAR(20) NOT NULL,
    `user_nickname` VARCHAR(20) NOT NULL,
    `profile_img` VARCHAR(100) NOT NULL,
    `profile_message` VARCHAR(100) NOT NULL,
    `is_quit` TINYINT(1) NOT NULL DEFAULT 0,
    `sign_up_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `create_user` INT NOT NULL,
    `channel_link` VARCHAR(100) NOT NULL,
    `max_capacity` INT NOT NULL,
    `is_quit` TINYINT(1) NOT NULL DEFAULT 0,
    `create_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`create_user`) REFERENCES `users`(`id`) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `chat_content` TEXT NOT NULL,
    `writer` INT NOT NULL,
    `chat_channel` INT NOT NULL,
    `create_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`chat_channel`) REFERENCES `channels`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`writer`) REFERENCES `users`(`id`) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `follows` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `follower` INT NOT NULL,
    `followee` INT NOT NULL,
    `follow_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`follower`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`followee`) REFERENCES `users`(`id`) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `blocked_by` INT NOT NULL,
    `blocked_user` INT NOT NULL,
    `blocked_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`blocked_by`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`blocked_user`) REFERENCES `users`(`id`) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;