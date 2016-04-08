#!/bin/sh

export TMPDIR=/tmp
DIR=$(dirname $0)

${DIR}/test/runCheckTest.sh ${DIR}/test/resources ${DIR}/assets

${DIR}/test/runInTest.sh ${DIR}/test/resources ${DIR}/assets