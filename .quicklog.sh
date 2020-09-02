#!/bin/bash
# Allow quick logging without opening full labbook

# Add an alias to your ~/.bash_profile:
# alias clq='sh ~/labbook/.quicklog.sh'

# Format today's date
date=$(date | awk '{print "\\section{"$1",", $3, $2"}"}')

# read the most recent entry date from log
log=$(tail -1 .log.date)

# check if today's date was already written
a=$(echo "$date")
b=$(echo "$log")

# Begin the entry and read input text
echo "Quick log entry"
read string

# If today's date is already logged, add supplemental entry
# Otherwise print new section date
contents=./main/contents_1.tex

if [[ $a =~ $b ]]
then
        echo "Supplemental log added"
        echo "\n$string" >> $contents
else
        echo "Initial daily log added"
        echo "\n$date" >> $contents
        echo "$string" >> $contents
fi

echo "$date" >> .log.date
