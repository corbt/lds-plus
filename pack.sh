#!/bin/bash

if [ "$#" -eq 1 ]
 then
 		if [ "$1" == "clean" ]
 			then
 				echo "Cleaning compiled JS and CSS files"
 				rm extension/stylesheets/*.css extension/javascripts/*.js
				exit
		fi
		# if [ "$1" == "pack" ]
		# 	then
		# 		zip -r extension.zip extension
		# 		exit
		# fi
		# echo "Unrecognized option $1. Valid options are \"clean\" or \"pack\"."
		# exit 1
fi
zip -r extension.zip extension
