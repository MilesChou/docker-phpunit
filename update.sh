#!/usr/bin/env bash

generated_warning() {
	cat <<-EOH
		#
		# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
		#
		# PLEASE DO NOT EDIT IT DIRECTLY.
		#
	EOH
}
ghcr.io/mileschou/xdebug:8.1-apache
build_dockerfile() {
    echo "Build ./${1}/Dockerfile ..."
    generated_warning > ./Dockerfile
    cat ./Dockerfile.template | sed -e 's!%%PHP_VERSION%%!'"ghcr.io/mileschou/xdebug:${LATEST_VERSION}-alpine"'!' >> ./Dockerfile

    for version in ${VERSIONS}; do
        echo "Build ./${version}/Dockerfile ..."
        mkdir -p ${version}

        generated_warning > ./${version}/Dockerfile
        cat ./Dockerfile.template | sed -e 's!%%PHP_VERSION%%!'"ghcr.io/mileschou/xdebug:${version}-alpine"'!' >> ./${version}/Dockerfile

        cp ./entrypoint.sh ${version}/entrypoint.sh
    done
}

LATEST_VERSION=8.1

VERSIONS="
5.5
5.6
7.0
7.1
7.2
7.3
7.4
8.0
8.1
"

echo "Build Dockerfile for PHPUnit ..."
build_dockerfile phpunit
