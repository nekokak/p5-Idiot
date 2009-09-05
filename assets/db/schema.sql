CREATE TABLE page (
    id           INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    guid         VARCHAR(36) character set utf8 collate utf8_bin NOT NULL default '',
    title        VARCHAR(255) NOT NULL,
    body         TEXT         NOT NULL,
    created_at   DATETIME     NOT NULL,
    updated_at   TIMESTAMP    NOT NULL,
    UNIQUE       guid  (guid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

