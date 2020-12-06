#! /usr/bin/env bash

s3_bucket=$1
version=$2

rm -r deployment/src 2> /dev/null
mkdir -p "deployment/src/${version}"
cp -r src/ "deployment/src/${version}"
# replace {version} with the version
sed -i '' "s/{version}/${version}/g" deployment/src/${version}/*.html
aws s3 sync "deployment/src" "s3://${s3_bucket}"
