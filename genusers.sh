#!/bin/sh

tmpIF=list.tmp #Original Input File
tmpUN=tempUsers.txt #Users only
tmpPW=tempPasswords.txt #Do not use
tmpPWFinal=tempFinalPasswords.txt #Just password chars
tmpPWp1=pwp1.txt #First character of pw
tmpPWp2=pwp2.txt #Second Char of pw
tmpPWp3=pwp3.txt #Third char of pw
tmpPWp4=pwp4.txt #Fourth char of pw
tmpPWp5=pwn5.txt #Nums of pw
tmpNum=tempFinalNums.txt #Phone nums only


## Cut off the top part of document
sed '1,10d' $1 > $tmpIF
#cat $tmpIF

## Get username
cat $tmpIF | awk '{print $1}' | tr '[:upper:]' '[:lower:]' > $tmpUN
#cat $tmpUN

## Cut off the first half of the columns 
cut -c47-91 $tmpIF | tr '[:upper:]' '[:lower:]' > $tmpPW
#cat $tmpPW

## Parse PW file, cut out just the first half of pw
cat $tmpPW | awk '{print $1,$2,$3,$5,$6}' > $tmpPWFinal
#cat $tmpPWFinal

## Parse PW file, cut out just "letters" and numbers for PW
cat $tmpPWFinal | awk '{print $1}' | cut -c1 | tr '[:upper:]' '[:lower:]' > $tmpPWp1
cat $tmpPWFinal | awk '{print $2}' | cut -c1 | tr '[:upper:]' '[:lower:]' > $tmpPWp2
cat $tmpPWFinal | awk '{print $3}' | cut -c1 | tr '[:upper:]' '[:lower:]' > $tmpPWp3
cat $tmpPWFinal | awk '{print $4}' | cut -c1 | tr '[:upper:]' '[:lower:]' > $tmpPWp4
cat $tmpPW |  awk '{print $NF}' | cut -c9-12 | tr '[:upper:]' '[:lower:]' > $tmpPWp5



## Parse files and piece together
paste -d, {$tmpUN,$tmpPWp1,$tmpPWp2,$tmpPWp3,$tmpPWp4,$tmpPWp5} | 
while IFS=, read a b c d e f g;
do
	echo $a : $b$c$d$e$f$g
done

## REMOVE ALL THE THINGS
rm -f $tmpIF $tmpUN $tmpPW $tmpPWFinal $tmpPWp1 $tmpPWp2 $tmpPWp3 $tmpPWp4 $tmpPWp5
