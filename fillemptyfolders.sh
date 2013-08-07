#!/bin/bash

function crgitignore(){
	isempty=`ls ${1}`
	if [ -n "$isempty" ] ; then
		for dir in $(ls -A1p ${1} | grep "/" | sed -e "s/\///g")
		do
			crgitignore ${1}/$dir
		done
	else
		echo ${1}
		touch ${1}/.gitignore
	fi
}

crgitignore $1
