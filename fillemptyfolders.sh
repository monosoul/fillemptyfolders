#!/bin/bash

function crgitignore(){
	isempty=`ls ${1}`
	if [ -n "$isempty" ] ; then
		for dir in $(ls -A1p ${1} | grep "/" | sed -e "s/\///g")
		do
			echo ${1}/$dir
			crgitignore ${1}/$dir
		done
	else
		touch ${1}/.gitignore
	fi
}

crgitignore $1
