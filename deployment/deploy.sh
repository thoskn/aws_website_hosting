#! /usr/bin/env bash

s3_bucket=$1
version=$2

rm -r deployment/src 2> /dev/null
mkdir -p "deployment/src/${version}"
cp -r src/ "deployment/src/${version}"
# replaces occurrences of '{version}' in the copied html files with the provided version of the website
sed -i '' "s/{version}/${version}/g" deployment/src/${version}/*.html
aws s3 sync "deployment/src" "s3://${s3_bucket}"
