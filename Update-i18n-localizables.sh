#!/bin/bash

if [ "$CONFIGURATION" == "Debug" ]; then
echo "Skipping i18n update script"
exit 0 #exit shell script
fi

echo 'update_strings.py START'

// Add/modify/remove i18n keys/values for each Localizable.strings file

SOURCE_DIR="${PROJECT_DIR}/${PROJECT_NAME}"
SCRIPTS_DIR="${PROJECT_DIR}/Scripts"
PODS_DIR="${PROJECT_DIR}/Pods"
REACTIVE_COCOA_DIR="${PODS_DIR}/ReactiveCocoa"

for loca in **/\*/Localizable.strings
do
    ${SCRIPTS_DIR}/update_strings.py $loca ${SOURCE_DIR} ${REACTIVE_COCOA_DIR}
done


echo 'update_strings.py END'