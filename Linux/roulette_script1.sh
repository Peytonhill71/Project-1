#!/bin/bash

cat $1
grep $2 | grep $3
awk -F' ' '{print $1 $2 $5 $6}'
