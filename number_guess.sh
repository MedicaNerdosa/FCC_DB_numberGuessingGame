#!/bin/bash
#number guessing game app
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
#user login
LOGIN() {
 echo "Enter your username:"
 read USERNAME
 USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
 #check if new user
 if [[ -z $USER_ID ]]
 then
    #add new user to database
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    GAME_START
 else
    #get user data from database
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME';")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME';")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    GAME_START
 fi
}

GAME_START() {
  RND_NUM=$(( $RANDOM % 1000 + 1 ))
  GUESS_COUNT=0
  GUESS
}

GUESS() {
  if [[ $1 ]]
  then
    echo $1
  else
    echo "Guess the secret number between 1 and 1000:"
  fi
  read USER_GUESS
  #check if input is an integer
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    GUESS_COUNT=$(( $GUESS_COUNT + 1 ))
    GUESS "That is not an integer, guess again:"
  else
    #evaluate user input against the random number
    if [[ $USER_GUESS -gt $RND_NUM ]]
    then
      GUESS_COUNT=$(( $GUESS_COUNT + 1 ))
      GUESS "It's lower than that, guess again:"
    elif [[ $USER_GUESS -lt $RND_NUM ]]
    then
      GUESS_COUNT=$(( $GUESS_COUNT + 1 ))
      GUESS "It's higher than that, guess again:"
    else
      GUESS_COUNT=$(( $GUESS_COUNT + 1 ))
      UPDATE_USER_DATA $GUESS_COUNT
      echo -e "\nYou guessed it in $GUESS_COUNT tries. The secret number was $RND_NUM. Nice job!"
    fi
  fi
}

UPDATE_USER_DATA() {
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME';")
  #if first game
  if [[ -z $GAMES_PLAYED ]]
  then
    #add the current stats
    FIRST_STATS_INSERTION=$($PSQL "UPDATE users SET games_played=1, best_game=$1 WHERE username='$USERNAME';")
  else
    #update stats
    UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=games_played+1 WHERE username='$USERNAME';")
    BEST_GAME_PLAYED=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME';")
    # if better performance this time update record
    if [[ $BEST_GAME -gt $1 ]]
    then
      UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game=$1 WHERE username='$USERNAME';")
    fi
  fi
}

LOGIN