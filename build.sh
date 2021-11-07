#!/bin/bash

cd "$(dirname "$0")"

NC='\033[0m' # No Color
RED='\033[0;31m'
YELLOW='\033[1;33m'

# declare an array called array and define 3 vales
versions=( 7.1 7.2 7.3 7.4 8.0 )

for version in "${versions[@]}"
do
  case ${version} in
  7.1 | 7.2 | 7.3 | 7.4 )
    distro="buster"
    ;;

  8.0)
    distro="bullseye"
    ;;

  *)
    distro="buster"
    ;;
esac
  echo -e "PHP VERSION: ${RED}${version}${NC}, IMAGE VERSION: ${YELLOW}${distro}${NC}"
  git pull
  docker build \
    --build-arg ARG_PHP_VERSION=${version} \
    --build-arg ARG_IMAGE_DISTRO=${distro} \
    -t yquan/fpm-php:${version} .
done
docker image push --all-tags yquan/fpm-php
