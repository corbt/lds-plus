#!/bin/bash

if [ "$#" -eq 1 ]
 then
 		if [ "$1" == "clean" ]
 			then
 				echo "Cleaning compiled JS and CSS files"
 				rm extension/stylesheets/*.css extension/javascripts/*.js
				exit
		fi
		if [ "$1" == "pack" ]
			then
				zip -r extension.zip extension
				exit
		fi
		echo "Unrecognized option $1. Valid options are \"clean\" or \"pack\"."
		exit 1
fi
echo "Starting compilers..."

# Start log fresh
rm -f compile.log

# rm extension/**/*.js extension/**/*.css

# Compile sasses to csses
sass --watch sources/sasses/:extension/stylesheets &>> compile.log &
SASS_PID=$!

# Compile coffeescripts to javascripts
coffee --output extension/javascripts/ --compile --watch sources/coffees/ &>> compile.log &
COFFEE_PID=$!

# Terminate compilers on exit 
CLEANUP="kill $SASS_PID $COFFEE_PID"
trap 'echo "Terminating..." && $CLEANUP && rm compile.log' INT

# Watch both logs
tail -f compile.log