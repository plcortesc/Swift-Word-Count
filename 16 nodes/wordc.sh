#!/bin/sh

avoid=";:,."

awk '{for(x=1;$x;++x)print $x}' "$1" | tr "${avoid}" "@" | sed 's/@//g' | sort |  uniq -c 

