#!/bin/bash
# Names are going to be 4 alpha characters, a hyphen, then 4 digits.

# 1st param - number of names to generate
num=$1

for (( c=0; c<$num; c++ ))
do
   # let make sure each name is unique, so loop until we create a new one
   available=0
   until [[ "$available" -eq "1" ]]; do

	   alphabet="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	   name=""

       case $(( RANDOM % 100 )) in
           0|99)
               name="$name$[($RANDOM % 10)]"
           	   name="$name-"
               name="$name$[($RANDOM % 10)]"
           	   name="$name-"												# weigth: 2%
               name="$name$[($RANDOM % 10)]" ;;								# 0-0-0 style

           1|30|50|70|98)
           	   name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
           	   name="$name-"
               name="$name$[($RANDOM % 10)]"								# weigth: 5%
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}" ;; 		# R-3X style

           12|22|42|62|82|92)
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
           	   name="$name-"
               name="$name$[($RANDOM % 10)]"
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"			# weigth: 6%
               name="$name$[($RANDOM % 10)]" ;; 							# EV-9D9 style

           6|26|56|76|86|96)
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
               name="$name$[($RANDOM % 10)]"
           	   name="$name-"
               name="$name$[($RANDOM % 10)]"
               name="$name$[($RANDOM % 10)]"								# weigth: 6%
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}" ;; 		# C1-10P style

           7|17|27|67|77|87|97)
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
           	   name="$name-"												# weigth: 7%
               name="$name$[($RANDOM % 10)]" ;;								# MSE-6 style

           31|32|35|36|37|38|39)
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
               name="$name$[($RANDOM % 10)]"
           	   name="$name-"
               name="$name$[($RANDOM % 10)]"								# weigth: 7%
               name="$name$[($RANDOM % 10)]" ;;								# L3-37 style

           40|41|45|46|47|49|94)
               name="$name$[($RANDOM % 10)]"
           	   name="$name-"
               name="$name$[($RANDOM % 10)]"								# weigth: 7%
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}" ;;		# 2-1B style

           15|52|57|61|89)
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
           	   name="$name-"												# weigth: 5%
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}" ;;		# D-O style

           5|25|55|65|85|90|91|95)
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
           	   name="$name-"												# weigth: 8%
               name="$name$[($RANDOM % 10)]" ;;								# AP-5 style

           9|11|20|54|69|71|72|81)
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
           	   name="$name-"
               name="$name$[($RANDOM % 10)]"								# weigth: 8%
               name="$name$[($RANDOM % 10)]" ;;								# IG-11 style

           4|14|24|34|44|64|74|84)
               name="$name$[($RANDOM % 10)]"
           	   name="$name-"
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"			# weigth: 8%
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}" ;;		# 4-LOM style

           8|18|28|29|48|58|68|78|88)
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
           	   name="$name-"												# weigth: 9%
               name="$name$[($RANDOM % 10)]" ;;								# BB-8 style

           3|10|13|23|33|43|53|63|73|83|93)
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
           	   name="$name-"
               name="$name$[($RANDOM % 10)]"
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"			# weight: 10%
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}" ;;		# C-3PO style

           2|16|19|21|51|59|60|66|75|79|80)
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"
               name="$name$[($RANDOM % 10)]"
           	   name="$name-"
               name="$name${alphabet:$((RANDOM % ${#alphabet})):1}"			# weight: 10%
               name="$name$[($RANDOM % 10)]" ;;								# R2-D2 style

       esac

       if [[ ! " ${used[*]} " =~ " ${name} " ]]; then
          available=1
       fi
   done
   used+=("$name")
   echo $name
done
