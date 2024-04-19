#!/bin/bash

# Variables
REPO_DIR="/path/to/repository/folder"
PACKAGES_DIR="/path/to/packages/folder"

# Create folders if they don't exist
mkdir -p $REPO_DIR
mkdir -p $PACKAGES_DIR

# Move packages to the packages folder
mv *.deb $PACKAGES_DIR

# Create the repository
cd $REPO_DIR
dpkg-scanpackages $PACKAGES_DIR /dev/null | gzip -9c > Packages.gz

# Create the Release file
cat <<EOF > Release
Origin: Repository_Name
Label: Repository_Name
Suite: stable
Version: 1.0
Codename: xenial
Architecture: amd64
EOF
