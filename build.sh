#!/usr/bin/env bash
set -o errexit

python -m pip install --upgrade pip
python -m pip install -r requirements.txt

python manage.py collectstatic --noinput
python manage.py migrate

# Load fixture data (safe to re-run)
python manage.py loaddata data/people_fixture.json || true


