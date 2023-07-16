#!/bin/sh

# DBが準備できるまで待つ
echo "MySQLを待っています..."
while ! mysqladmin ping -h"db" --silent; do
    sleep 1
done
echo "MySQLが起動し、稼働しています！"

# メインのアプリケーションを起動する
exec "$@"