#!/bin/bash

echo -e "\nwhat type of file do you want to create?"
echo -e "\t1: html"
echo -e "\t2: tex (self-notes)"
echo -e "\t3: javafx build.gradle"

read filetype

root="https://gists.tayleyi.com"

htmlURL="${root}/template.html"

texURL="${root}/personal-notes.tex"

if [ $filetype -eq "1" ]; then
	curl $htmlURL > $1
fi

if [ $filetype -eq "2" ]; then
	curl $texURL > $1
fi

if [ $filetype -eq "3" ]; then
	curl "${root}/fx-build.gradle" > $1
fi
