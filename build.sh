#!/bin/sh

VERSION=${1:-4.9.8}

docker build -t zhetc/java_oci_manage:"$VERSION" --network=host --build-arg VERSION="$VERSION" .

docker push zhetc/java_oci_manage:"$VERSION"

docker tag zhetc/java_oci_manage:"$VERSION" zhetc/java_oci_manage:latest

docker push zhetc/java_oci_manage:latest