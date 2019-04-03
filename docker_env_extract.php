<?php

$list_vars = array(
    "APP_KEY",
    "APP_DEBUG",
    "APP_LOG_LEVEL",
    "APP_URL",
    "OPUS_MAIL_SENDER_ADDRESS",
    "OPUS_MAIL_SENDER_NAME",
    "DB_CONNECTION",
    "DB_HOST",
    "DB_PORT",
    "DB_DATABASE",
    "DB_USERNAME",
    "DB_PASSWORD",
    "BROADCAST_DRIVER",
    "CACHE_DRIVER",
    "SESSION_DRIVER",
    "QUEUE_DRIVER",
    "REDIS_HOST",
    "REDIS_PASSWORD",
    "REDIS_PORT",
    "MAIL_DRIVER",
    "MAIL_HOST",
    "MAIL_PORT",
    "MAIL_USERNAME",
    "MAIL_PASSWORD",
    "MAIL_ENCRYPTION",
    "PUSHER_APP_ID",
    "PUSHER_KEY",
    "PUSHER_SECRET",
);

$env = "";

foreach($list_vars as $v) {
    $env .= $v."=".getenv($v)."\n";
}
file_put_contents(".env", $env);
