#!/bin/bash
set -e

# declare -a aliases
# aliases=(
# 	[2.2]='2 latest'
# )

alias readlink=greadlink
cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( */ )
versions=( "${versions[@]%/}" )

url='git://github.com/alpine-library/ruby'
echo '# maintainer: Ekozan <m@3Ko.fr>'

for version in "${versions[@]}"; do
	commit="$(cd "$version" && git log -1 --format='format:%H' -- Dockerfile $(awk 'toupper($1) == "COPY" { for (i = 2; i < NF; i++) { print $i } }' Dockerfile))"
	fullVersion="$(grep -m1 'ENV MYSQL_VERSION ' "$version/Dockerfile" | cut -d' ' -f3)"
	versionAliases=()
	while [ "$fullVersion" != "$version" -a "${fullVersion%[.-]*}" != "$fullVersion" ]; do
		versionAliases+=( $fullVersion )
		fullVersion="${fullVersion%[.-]*}"
	done
	# versionAliases+=( $version ${aliases[$version]} )

	echo
	for va in "${versionAliases[@]}"; do
		echo "$va: ${url}@${commit} $version"
	done
done
