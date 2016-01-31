#!/usr/bin/env bash

#
# ./a-Lambda.sh - alpha Lambda - frequency analyst for letters
#

# Jorge de la Torre - jorgedlt@gmail.com

myfile='corncob_lowercase.txt'

# cat $myfile | grep -o . | tr 'A-Z' 'a-z' | grep '[[:alpha:]]' | sort -f | uniq -c

resultsRAW=$( cat $myfile | grep -o . | tr 'A-Z' 'a-z' | grep '[[:alpha:]]' )

 echo "$resultsRAW" | tr -d ' ' > debug.file

totalCHAR=$( echo "$resultsRAW" | wc -c | tr -d ' ' )

distCHAR=$( echo "$resultsRAW" | sort -f | uniq -c | head -26 )

printf '%s\n' "$distCHAR" | while IFS=' ' read -r lCOUNT lVALUE
do
   lPERCN=$(echo "scale=4; ($lCOUNT/$totalCHAR)*100" | bc )
   printf "\t %s \t %6d \t %2.4f \n" $lVALUE $lCOUNT $lPERCN
done

exit 0;

# http://www.letterfrequency.org/#english-language-letter-frequency
