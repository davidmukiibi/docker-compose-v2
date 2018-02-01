#!/usr/bin/env bash
set -e

initdb -D /var/lib/postgresql/data -EUTF-8
pg_ctl -D /var/lib/postgresql/data -l logfile start && createdb -O postgres dockerdb
python manage.py db init
python manage.py db migrate
python manage.py db upgrade