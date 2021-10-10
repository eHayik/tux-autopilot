#!/bin/sh
# jdeps-spring-boot

set -eu

readonly TARGET_JAR=$1
readonly TARGET_VER=$2

#Directory to extract the jar
readonly TMP_DIR="/tmp/app-jar"
mkdir -p ${TMP_DIR}
trap 'rm -rf ${TMP_DIR}' EXIT

#Extract the jar
unzip -q "${TARGET_JAR}" -d "${TMP_DIR}"

#output
jdeps \
    -classpath \'${TMP_DIR}/BOOT-INF/lib/*:${TMP_DIR}/BOOT-INF/classes:${TMP_DIR}\' \
    --print-module-deps \
    --ignore-missing-deps \
    --module-path ${TMP_DIR}/BOOT-INF/lib/javax.activation-api-1.2.0.jar \
    --multi-release ${TARGET_VER} \
    --recursive \
    -quiet \
    ${TMP_DIR}/org ${TMP_DIR}/BOOT-INF/classes ${TMP_DIR}/BOOT-INF/lib/*.jar
