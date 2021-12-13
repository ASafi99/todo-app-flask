#!/bin/bash

source venv/bin/activate

python3 -m pytest \
    --cov=application \
    --cov-report term-missing \
    --cov-report xml:test_reports/coverage.xml \
    --junitxml=test_reports/junit_report.xml