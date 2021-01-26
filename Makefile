PWD=$(shell pwd)
NEW_PATH=$(PATH):$(PWD)
PATH := $(shell export PATH=$(NEW_PATH))
SHELL := /bin/bash

args: ##Tests the script by giving it arguments
	./main -a -o if=/dev/random xvf

stdin: ##Tests the script by feeding a string to stdin
	echo "nick is awesome" | ./main

file: ##Tests the script by feeding a text file into stdin
	cat test.txt | ./main

path:
	echo "$(PATH)"

