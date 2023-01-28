#!/bin/sh
echo "\033[33m Node modules instaling \033[37m"
npm install
echo "\033[33m Node modules instaled \033[37m"
echo "\033[33m Node run \033[37m"
npm run watch
# if [ ! -z "$APP_ENV" ] ; then
    # npm run dev
# else
    # npm run build
# fi