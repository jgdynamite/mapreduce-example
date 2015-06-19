#!/bin/bash
#This reducer script will take-in output from the mapper and emit starting letter of each word and average length
#Remember that the framework will sort the output from the mappers based on the Key
#Note that the input to a reducer will be of a form(Key,Value)and not (Key,
#This is unlike the input i.e.; usually passed to a reducer written in Java.
lastkey="";
count=0;
total=0;
iteration=1
while read line
 do
  newkey=`echo $line | awk '{print $1}'`
  value=`echo $line | awk '{print $2}'`
   if [ "$iteration" == "1" ] then
	lastkey=$newkey;c
	iteration=`expr $iteration + 1`;
   fi
   if [[ "$lastkey" != "$newkey" ]] then
	average=`echo "scale=5;$total / $count" | bc`;
	echo -e "$lastkey\t$average"
	count=0;
	lastkey=$newkey;
	total=0;
	average=0;
   fi
   total=`expr $total + $value`;
   lastkey=$newkey;
   count=`expr $count + 1`;
done
#The output would be Key,Value pairs(letter,average length of the words starting with this letter)

