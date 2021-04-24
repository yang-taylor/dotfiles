#!/bin/bash

echo -e "\nwhat type of file do you want to create?"
echo -e "\t1: html"
echo -e "\t2: tex (self-notes)"
echo -e "\t3: javafx build.gradle"
echo -e "\t4: markdown"
echo -e "\t5: python"

read filetype

root="https://gists.tayleyi.com"

htmlURL="${root}/template.html"

texURL="${root}/notes.tex"

if [ $filetype -eq "1" ]; then
	curl $htmlURL > $1
fi

if [ $filetype -eq "2" ]; then
	curl $texURL > $1
fi

if [ $filetype -eq "3" ]; then
	curl "${root}/build.gradle" > $1
fi

if [ $filetype -eq "4" ]; then
	curl "${root}/metadata.md" > $1
fi

if [ $filetype -eq "5" ]; then
	curl "${root}/tkinter" > $1
fi
