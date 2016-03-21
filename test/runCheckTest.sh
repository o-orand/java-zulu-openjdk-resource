#!/bin/sh

if [ $# -ne 2 ]
then
    echo "usage $0 <TEST_RESOURCE_DIR> <ASSETS_DIR>"
    exit 1
fi
EXPECTED_ANSWER=5

TEST_RESOURCE_DIR=$1
ASSETS_DIR=$2

LOG_FILE=$(mktemp $TMPDIR/zulu-openjdk-resource-check-test-log.XXXXXX)

echo "Running check test - (log file: $LOG_FILE)"
for testFile in $(ls ${TEST_RESOURCE_DIR}/check-request-*.sample)
do
    echo "Running ${testFile}"
    echo '{"test":"'${testFile}'"}' >>${LOG_FILE}
    echo "###################"
    ${ASSETS_DIR}/check <${testFile} |tee -a ${LOG_FILE}
    echo "###################"
    echo "Done ${testFile}"
done

ANSWER_COUNT=$(cat ${LOG_FILE:-/dev/null}|jq '.[0]?.version'|wc -l)
if [ ${ANSWER_COUNT} -ne ${EXPECTED_ANSWER} ]
then
    echo "Assertion FAILURE - Answer expected ${EXPECTED_ANSWER} - Answer detected ${ANSWER_COUNT}"
    echo "log file: $LOG_FILE"
    cat ${LOG_FILE:-/dev/null}
    exit 1
fi
