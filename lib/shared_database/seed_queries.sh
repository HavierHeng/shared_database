#!/bin/bash

file="queries.txt"

cat $file | while read query 
do
   rake query:add "$query"
done


# From bundle exec irb, faster than using the above bash script
# require "shared_database"
# queries = IO.readlines("#{Dir.pwd}/lib/shared_database/queries.txt")
# queries = queries.map(&:strip)
# queries = queries.map{ |query| {"query": query} }
# Query.create(queries)