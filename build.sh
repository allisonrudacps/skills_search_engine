#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt
python manage.py migrate
python manage.py loaddata data/people_fixture.json
python manage.py collectstatic --noinput



