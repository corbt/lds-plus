#!/bin/bash

# Start log fresh
rm -f compile.log

# Compile coffeescripts to javascripts
coffee --output extension/javascripts/ --compile --watch sources/coffees/ &>> compile.log &
COFFEE_PID=$!

# Compile sasses to csses
sass --watch sources/sasses/:extension/stylesheets &>> compile.log &
SASS_PID=$!

# Terminate compilers on exit 
trap 'echo "Terminating..." && kill $COFFEE_PID $SASS_PID' INT

# Watch both logs
tail -f compile.log