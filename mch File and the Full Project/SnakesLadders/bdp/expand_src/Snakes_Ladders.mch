/* Snakes_Ladders
 * Author: Athindu
 * IIT ID: 2018580
 * UoW ID: w1742249
 * Creation date: 20/01/2022
 */


MACHINE
    Snakes_Ladders

SETS
    //Set to represent Game Alerts
    MESSAGES = { Moved_to_a_Normal_Square , Moved_down_a_Snake , Moved_up_a_Ladder , Value_is_too_high_to_FINISH , Game_FINISHED_and_WON , Start_a_new_GAME } ;

    //Set used to represent Game Statistic
    STAT_ALERTS = { Square_Occupy , Current_Position , No_of_SNAKES_faced , No_of_LADDERS_faced , No_of_Turns } ;

    //Set to represent Game's current status
    GAME_STATE = { Game_Won , Game_not_over }


CONCRETE_CONSTANTS
    Board , Snakes , Ladders , StartPosition , WinPosition

PROPERTIES

    //Board value ranges from 1 to 100
    Board <: NAT1 & Board = 1 .. 100 &

    //Snakes positions (Heads First)
    Snakes = { 31 |-> 4 , 16 |-> 13 , 47 |-> 25 , 63 |-> 60 , 66 |-> 52 , 97 |-> 75 } &

    //Ladders positions
    Ladders = { 3 |-> 39 , 10 |-> 12 , 27 |-> 53 , 56 |-> 84 , 72 |-> 90 , 61 |-> 99 } &

    StartPosition = 1 &
    WinPosition = 100

DEFINITIONS

    //Check whether the game has finished or not
    isGameWon == ( currentPosition = WinPosition ) ;


    isInsideBoard ( position ) == ( position <= WinPosition ) ;


    isHitSnake ( position ) == position : ( dom ( Snakes ) ) ;


    isHitLadder ( position ) == position : ( dom ( Ladders ) ) ;


    isWining ( position ) == ( position = WinPosition )

ABSTRACT_VARIABLES
    currentPosition , snakesFaced , laddersFaced , turnsCount , route , lastDiceValue , gameStatus

INVARIANT
    currentPosition : Board &
    snakesFaced : NAT &
    laddersFaced : NAT &
    turnsCount : NAT &
    lastDiceValue : NAT &
    route : seq ( Board ) &
    gameStatus <: GAME_STATE

INITIALISATION
    currentPosition := 1 ||
    snakesFaced := 0 ||
    laddersFaced := 0 ||
    turnsCount := 0 ||
    lastDiceValue := 0 ||
    route := [ StartPosition ] ||
    gameStatus := {}


OPERATIONS

    /* 4 Operations were implemented -> Move of the player, Statistics of the Game, 
     *  Squares Visited by the player, New Game        
     */


    //Values from 1-6 were passed to the operation to perform the movements
    message <-- DiceRoll ( diceValue ) =
    PRE
        diceValue : 1 .. 6 & message : MESSAGES & not ( isGameWon )
    THEN

        //Check to avoid player exceeding the limit of the board (100)
        IF isInsideBoard ( currentPosition + diceValue )
        THEN
            lastDiceValue := diceValue ||
            turnsCount := turnsCount + 1 ||

            //Player encountering a Snake
            IF isHitSnake ( currentPosition + diceValue )
            THEN
                route := route <- currentPosition + diceValue <- Snakes ( currentPosition + diceValue ) ||
                currentPosition := Snakes ( currentPosition + diceValue ) ||
                snakesFaced := snakesFaced + 1 ||
                message := Moved_down_a_Snake ||
                gameStatus := { Game_not_over }
                //occupySquare := (Square_Occupy |-> Snakes(currentPosition+diceValue))

            //Player encountering a Ladder    
            ELSIF isHitLadder ( currentPosition + diceValue )
            THEN
                route := route <- currentPosition + diceValue <- Ladders ( currentPosition + diceValue ) ||
                currentPosition := Ladders ( currentPosition + diceValue ) ||
                laddersFaced := laddersFaced + 1 ||
                message := Moved_up_a_Ladder ||
                gameStatus := { Game_not_over }
                //occupySquare := (Square_Occupy |-> Ladders(currentPosition+diceValue))

            //Player about to WIN 
            ELSIF isWining ( currentPosition + diceValue )
            THEN
                route := route <- currentPosition + diceValue ||
                currentPosition := currentPosition + diceValue ||
                message := Game_FINISHED_and_WON ||
                gameStatus := { Game_Won }
                //occupySquare := (Square_Occupy |-> (currentPosition+diceValue))

            //Movement to a normal square    
            ELSE
                route := route <- currentPosition + diceValue ||
                currentPosition := currentPosition + diceValue ||
                message := Moved_to_a_Normal_Square ||
                gameStatus := { Game_not_over }
                //occupySquare := (Square_Occupy |-> (currentPosition+diceValue)) 
            END
        ELSE
            message := Value_is_too_high_to_FINISH ||
            gameStatus := { Game_not_over }
        END
    END ;


    //Operation to output main statistics of the Game
    playerPosition , snakesCount , laddersCount , turnsNum <-- GameStat =
    BEGIN
        playerPosition := ( Current_Position |-> currentPosition ) ||
        snakesCount := ( No_of_SNAKES_faced |-> snakesFaced ) ||
        laddersCount := ( No_of_LADDERS_faced |-> laddersFaced ) ||
        turnsNum := ( No_of_Turns |-> turnsCount )
    END ;


    //Operation to output the player's visited squares as a sequence
    visitedPath <-- VisitedSquares =
    BEGIN
        visitedPath := route
    END ;


    //Operation to restart/ reset the Game
    message <-- NewGame =
    PRE
        message : MESSAGES
    THEN
        currentPosition := 1 ||
        snakesFaced := 0 ||
        laddersFaced := 0 ||
        turnsCount := 0 ||
        lastDiceValue := 0 ||
        route := [ StartPosition ] ||
        gameStatus := {} ||
        message := Start_a_new_GAME
    END

END
