-- Create "user" table
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `bio` varchar(255) NOT NULL,
  `image` varchar(255) NULL,
  `created_at` datetime NOT NULL DEFAULT (current_timestamp()),
  `updated_at` datetime NOT NULL DEFAULT (current_timestamp()) ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email`),
  UNIQUE INDEX `username` (`username`)
) CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
-- Create "article" table
CREATE TABLE `article` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `body` varchar(255) NOT NULL,
  `author_id` int unsigned NOT NULL,
  `is_published` bool NOT NULL,
  `created_at` datetime NOT NULL DEFAULT (current_timestamp()),
  `updated_at` datetime NOT NULL DEFAULT (current_timestamp()) ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  INDEX `author_id` (`author_id`),
  UNIQUE INDEX `slug` (`slug`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
) CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
-- Create "article_favorite" table
CREATE TABLE `article_favorite` (
  `article_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT (current_timestamp()),
  `updated_at` datetime NOT NULL DEFAULT (current_timestamp()) ON UPDATE current_timestamp(),
  PRIMARY KEY (`article_id`, `user_id`),
  INDEX `user_id` (`user_id`),
  CONSTRAINT `article_favorite_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `article_favorite_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
) CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
-- Create "tag" table
CREATE TABLE `tag` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT (current_timestamp()),
  `updated_at` datetime NOT NULL DEFAULT (current_timestamp()) ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name`)
) CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
-- Create "article_tag" table
CREATE TABLE `article_tag` (
  `article_id` int unsigned NOT NULL,
  `tag_id` int unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT (current_timestamp()),
  `updated_at` datetime NOT NULL DEFAULT (current_timestamp()) ON UPDATE current_timestamp(),
  PRIMARY KEY (`article_id`, `tag_id`),
  INDEX `tag_id` (`tag_id`),
  CONSTRAINT `article_tag_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `article_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
) CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
-- Create "comment" table
CREATE TABLE `comment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `body` varchar(255) NOT NULL,
  `author_id` int unsigned NOT NULL,
  `article_id` int unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT (current_timestamp()),
  `updated_at` datetime NOT NULL DEFAULT (current_timestamp()) ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  INDEX `article_id` (`article_id`),
  INDEX `author_id` (`author_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
) CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
-- Create "follow" table
CREATE TABLE `follow` (
  `follower_id` int unsigned NOT NULL,
  `followed_id` int unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT (current_timestamp()),
  `updated_at` datetime NOT NULL DEFAULT (current_timestamp()) ON UPDATE current_timestamp(),
  PRIMARY KEY (`follower_id`, `followed_id`),
  INDEX `followed_id` (`followed_id`),
  CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`follower_id`) REFERENCES `user` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`followed_id`) REFERENCES `user` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
) CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
