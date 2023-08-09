#!/bin/bash

file="queries.txt"

cat $file | while read query 
do
   rake query:add "$query"
done

