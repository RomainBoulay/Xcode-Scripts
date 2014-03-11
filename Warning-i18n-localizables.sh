#!/bin/bash

echo 'objc_strings.py START'
// Add warnings in project if i18n keys are unsued or missing
SOURCE_DIR="${PROJECT_DIR}/${PROJECT_NAME}"
SCRIPTS_DIR="${PROJECT_DIR}/Scripts"

${SCRIPTS_DIR}/objc_strings.py ${SOURCE_DIR}
echo 'objc_strings.py END'
