#!/bin/bash                                                                                                            
clear                                                                                                                   
potentialWords=("duck" "tree" "moon" "bell" "door" "fish" "dark" "bean" "army" "baby" "ball" "bear" "bird" "bone" "book" "coin" "foot" "dash" "gift" "crow" "fire" "gold" "dirt" "star" "bean" "poop" "pink" "blue" "quit" "quiz" "salt”" "jazz" "game" "gear" "lazy" "mask")
word=${potentialWords[$((0 + $RANDOM % ${#potentialWords[@]}))]}
guesses=4
while [ $guesses -gt 0 ]; do
 read guess
if [ ! ${#guess} -eq 4 ];then
  echo "guess must have 4 letters"
 else
  i=0
  hint=""
  while [ $i -lt 4 ]; do
   if [[ ${word:$i:1} == ${guess:$i:1} ]];then
    hint=$hint"\e[32m"${guess:$i:1}
   elif [[ $word == *"${guess:$i:1}"* ]];then
    hint=$hint"\e[33m"${guess:$i:1}
   else
    hint=$hint"\e[31m"${guess:$i:1}
   fi
   let i=i+1
  done
  echo -e $hint"\e[37m"
  if [ $guess == $word ];then
   echo "congrats, you won!!"
   guesses=1
  fi
 fi
 let guesses-=1
 echo 'you have '$guesses' guess(es) left'
done
echo 'The word was '$word

