#!/bin/bash

# This script automatically sets the version and short version string of
# an Xcode project from the Git repository containing the project.
#

if [ "$CONFIGURATION" == "Debug" ]; then
echo "Skipping git version based script"
exit 0 #exit shell script
fi


set -o errexit
set -o nounset

# Get info.plist path
INFO_PLIST="${BUILT_PRODUCTS_DIR}/${WRAPPER_NAME}/Info"
APP_SHORT_VERSION_PLIST=`/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "${INFOPLIST_FILE}"`
DOT="."

# Get git commit number from HEAD's branch
VERSION=$(git --git-dir="${PROJECT_DIR}/.git" --work-tree="${PROJECT_DIR}/" rev-list HEAD | wc -l)

# Trim spaces
VERSION=$(echo "${VERSION}" | sed -e 's/^[ \t]*//')

# Concatenate short version and commit count
VERSION=$APP_SHORT_VERSION_PLIST$DOT$VERSION

# DEBUG
echo "VERSION: ${VERSION}"

# Write version to file
echo $VERSION > ${PROJECT_DIR}/app_version.txt


# Write to plist
defaults write $INFO_PLIST CFBundleVersion $VERSION

#Export version
export VERSION=$VERSION
