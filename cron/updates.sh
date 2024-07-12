#!/bin/bash
# run this script as the appropriate user's cron job
# can be activated (once only) as:
# crontab -e
# and then add the following line to run the script every hour:
# 0 * * * * /path/to/update.sh
# or to run the script every night at 1:30 am:
# 30 1 * * * /path/to/update.sh


# get the location of the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# move one level up
cd $SCRIPT_DIR/..

# pull the latest changes to the repository
git pull

# update the docker compose file
docker compose pull
docker compose build
docker compose up -d