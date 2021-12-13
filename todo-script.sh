#!/bin/bash

# environment variables 
export DATABASE_URI= DATABASE_URI CREATE_SCHEMA=true

# install apt dependencies
sudo apt update 
sudo apt install python3 python3-venv python3-pip -y

#create and activate venv
python3 -m venv venv
source venv/bin/activate

# install pip requirements
pip3 install -r requirements.txt

# run tests
mvn clean test 

python3 -m pytest \
    --cov=application \
    --cov-report term-missing \
    --cov-report xml:test_reports/coverage.xml \
    --junitxml=test_reports/junit_report.xml

# run create.py to create schema
if [$CREATE_SCHEMA == "true" ]
then
	echo "Creating schema..."
    python3 create.py
    echo "Schema created!"
fi

# run the app
# python3 app.py