#!/bin/bash

script=$1

if [ -n "$script" ] && [ -e "$script" ] && [ ! -x "$script" ] && [ -0 "$script" ]
then
	chmod u+x "$script"
fi
