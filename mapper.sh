#!/bin/bash
#This mapper script will read one line at a time and then break it into words
#For each word starting LETTER and LENGTH of the word are emitted
#file=$1
while read line
     do
	 for word in $line; do
		 if [ -n "$word" ]; then
			wcount=`echo $word | wc -m`;
		 	wlength=`expr $wcount - 1`;
			letter=`echo $word | head -c1`;
	echo -e "$letter\t$wlength";
 		fi
#	echo $word
     done
#	echo $line
     done < test
#The output of the mapper would be “starting letter of each word” and “its length”, separated by a tab space.
