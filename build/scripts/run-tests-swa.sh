#!/bin/bash
set -e

cleanup() {
	kill %%
}
trap cleanup 0

npm install @azure/static-web-apps-cli@0.8.3
SWA_PATH=`pwd`/node_modules/.bin/swa

export BOOTSTRAP_APP_PATH=$1
export BOOTSTRAP_TEST_RUNNER_PATH=$2
export BOOTSTRAP_TEST_RUNNER_URL=$3

echo "BOOTSTRAP_APP_PATH=$BOOTSTRAP_APP_PATH"
echo "BOOTSTRAP_TEST_RUNNER_PATH=$BOOTSTRAP_TEST_RUNNER_PATH"
echo "BOOTSTRAP_TEST_RUNNER_URL=$BOOTSTRAP_TEST_RUNNER_URL"

cd $BOOTSTRAP_APP_PATH
$SWA_PATH start --port 8000 --app-location "$BOOTSTRAP_APP_PATH" &

cd $BOOTSTRAP_TEST_RUNNER_PATH
npm install
node app