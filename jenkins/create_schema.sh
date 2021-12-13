#!/bin/bash

source venv/bin/activate

sh 'echo "creating schema..."'     
                sh "python3 create.py"

                sh 'echo " Schema created!"'