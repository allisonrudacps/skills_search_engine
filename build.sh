#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt

python manage.py migrate

# Only load data if file exists and is non-empty
if [ -s data/people_fixture.json ]; then
  python manage.py loaddata data/people_fixture.json
else
  echo "people_fixture.json missing or empty — skipping loaddata"
fi

python manage.py collectstatic --noinput
