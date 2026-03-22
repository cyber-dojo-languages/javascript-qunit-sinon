#!/usr/bin/env bash
set -Eeu

readonly MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly REGEX="image_name\": \"(.*)\""
readonly JSON=`cat ${MY_DIR}/docker/image_name.json`
[[ ${JSON} =~ ${REGEX} ]]
readonly IMAGE_NAME="${BASH_REMATCH[1]}"

function echo_package_version()
{
  local -r name="${1}"
  local -r pattern=" ${name}@"
  local -r command="npm list | grep -E '${pattern}'"
  docker run --rm -i ${IMAGE_NAME} sh -c "${command}"
}

readonly EXPECTED=2.25.0 # qunit version
readonly ACTUAL="$(echo_package_version qunit)"

#echo_package_version sinon

if echo "${ACTUAL}" | grep -q "${EXPECTED}"; then
  echo "VERSION CONFIRMED as ${EXPECTED}"
else
  echo "VERSION EXPECTED: ${EXPECTED}"
  echo "VERSION   ACTUAL: ${ACTUAL}"
  exit 42
fi
