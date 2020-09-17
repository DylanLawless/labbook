#!/bin/bash
# Allow quick logging without opening full labbook

# Add an alias to your ~/.bash_profile:
# alias clq='sh ~/labbook/.quicklog.sh'

# Set your labbook directory here on line 8
labbook=~/labbook

# If you add a new working contents files (e.g. 1 every year) then update this path on line 11 to match
contents=$labbook/main/contents_1.tex

# Format today's date
date=$(date | awk '{print "\\section{"$1",", $3, $2"}"}')

# read the most recent entry date from log
# Note that your directory where your labbook is stored must be set on line 8
log=$(tail -1 "$labbook"/.log.date)

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

# Print the date to the log every time a quick entry is made
echo "$date" >> "$labbook"/.log.date
