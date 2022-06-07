Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Snakes_Ladders))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Snakes_Ladders))==(Machine(Snakes_Ladders));
  Level(Machine(Snakes_Ladders))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Snakes_Ladders)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Snakes_Ladders))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Snakes_Ladders))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Snakes_Ladders))==(?);
  List_Includes(Machine(Snakes_Ladders))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Snakes_Ladders))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Snakes_Ladders))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Snakes_Ladders))==(?);
  Context_List_Variables(Machine(Snakes_Ladders))==(?);
  Abstract_List_Variables(Machine(Snakes_Ladders))==(?);
  Local_List_Variables(Machine(Snakes_Ladders))==(gameStatus,lastDiceValue,route,turnsCount,laddersFaced,snakesFaced,currentPosition);
  List_Variables(Machine(Snakes_Ladders))==(gameStatus,lastDiceValue,route,turnsCount,laddersFaced,snakesFaced,currentPosition);
  External_List_Variables(Machine(Snakes_Ladders))==(gameStatus,lastDiceValue,route,turnsCount,laddersFaced,snakesFaced,currentPosition)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Snakes_Ladders))==(?);
  Abstract_List_VisibleVariables(Machine(Snakes_Ladders))==(?);
  External_List_VisibleVariables(Machine(Snakes_Ladders))==(?);
  Expanded_List_VisibleVariables(Machine(Snakes_Ladders))==(?);
  List_VisibleVariables(Machine(Snakes_Ladders))==(?);
  Internal_List_VisibleVariables(Machine(Snakes_Ladders))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Snakes_Ladders))==(btrue);
  Gluing_List_Invariant(Machine(Snakes_Ladders))==(btrue);
  Expanded_List_Invariant(Machine(Snakes_Ladders))==(btrue);
  Abstract_List_Invariant(Machine(Snakes_Ladders))==(btrue);
  Context_List_Invariant(Machine(Snakes_Ladders))==(btrue);
  List_Invariant(Machine(Snakes_Ladders))==(currentPosition: Board & snakesFaced: NAT & laddersFaced: NAT & turnsCount: NAT & lastDiceValue: NAT & route: seq(Board) & gameStatus <: GAME_STATE)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Snakes_Ladders))==(btrue);
  Abstract_List_Assertions(Machine(Snakes_Ladders))==(btrue);
  Context_List_Assertions(Machine(Snakes_Ladders))==(btrue);
  List_Assertions(Machine(Snakes_Ladders))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Snakes_Ladders))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Snakes_Ladders))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Snakes_Ladders))==(currentPosition,snakesFaced,laddersFaced,turnsCount,lastDiceValue,route,gameStatus:=1,0,0,0,0,[StartPosition],{});
  Context_List_Initialisation(Machine(Snakes_Ladders))==(skip);
  List_Initialisation(Machine(Snakes_Ladders))==(currentPosition:=1 || snakesFaced:=0 || laddersFaced:=0 || turnsCount:=0 || lastDiceValue:=0 || route:=[StartPosition] || gameStatus:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Snakes_Ladders))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Snakes_Ladders))==(btrue);
  List_Constraints(Machine(Snakes_Ladders))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Snakes_Ladders))==(DiceRoll,GameStat,VisitedSquares,NewGame);
  List_Operations(Machine(Snakes_Ladders))==(DiceRoll,GameStat,VisitedSquares,NewGame)
END
&
THEORY ListInputX IS
  List_Input(Machine(Snakes_Ladders),DiceRoll)==(diceValue);
  List_Input(Machine(Snakes_Ladders),GameStat)==(?);
  List_Input(Machine(Snakes_Ladders),VisitedSquares)==(?);
  List_Input(Machine(Snakes_Ladders),NewGame)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Snakes_Ladders),DiceRoll)==(message);
  List_Output(Machine(Snakes_Ladders),GameStat)==(playerPosition,snakesCount,laddersCount,turnsNum);
  List_Output(Machine(Snakes_Ladders),VisitedSquares)==(visitedPath);
  List_Output(Machine(Snakes_Ladders),NewGame)==(message)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Snakes_Ladders),DiceRoll)==(message <-- DiceRoll(diceValue));
  List_Header(Machine(Snakes_Ladders),GameStat)==(playerPosition,snakesCount,laddersCount,turnsNum <-- GameStat);
  List_Header(Machine(Snakes_Ladders),VisitedSquares)==(visitedPath <-- VisitedSquares);
  List_Header(Machine(Snakes_Ladders),NewGame)==(message <-- NewGame)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Snakes_Ladders),DiceRoll)==(diceValue: 1..6 & message: MESSAGES & not(currentPosition = WinPosition));
  List_Precondition(Machine(Snakes_Ladders),GameStat)==(btrue);
  List_Precondition(Machine(Snakes_Ladders),VisitedSquares)==(btrue);
  List_Precondition(Machine(Snakes_Ladders),NewGame)==(message: MESSAGES)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Snakes_Ladders),NewGame)==(message: MESSAGES | currentPosition,snakesFaced,laddersFaced,turnsCount,lastDiceValue,route,gameStatus,message:=1,0,0,0,0,[StartPosition],{},Start_a_new_GAME);
  Expanded_List_Substitution(Machine(Snakes_Ladders),VisitedSquares)==(btrue | visitedPath:=route);
  Expanded_List_Substitution(Machine(Snakes_Ladders),GameStat)==(btrue | playerPosition,snakesCount,laddersCount,turnsNum:=Current_Position|->currentPosition,No_of_SNAKES_faced|->snakesFaced,No_of_LADDERS_faced|->laddersFaced,No_of_Turns|->turnsCount);
  Expanded_List_Substitution(Machine(Snakes_Ladders),DiceRoll)==(diceValue: 1..6 & message: MESSAGES & not(currentPosition = WinPosition) | currentPosition+diceValue<=WinPosition ==> (lastDiceValue,turnsCount:=diceValue,turnsCount+1 || (currentPosition+diceValue: dom(Snakes) ==> route,currentPosition,snakesFaced,message,gameStatus:=route<-currentPosition+diceValue<-Snakes(currentPosition+diceValue),Snakes(currentPosition+diceValue),snakesFaced+1,Moved_down_a_Snake,{Game_not_over} [] not(currentPosition+diceValue: dom(Snakes)) ==> (currentPosition+diceValue: dom(Ladders) ==> route,currentPosition,laddersFaced,message,gameStatus:=route<-currentPosition+diceValue<-Ladders(currentPosition+diceValue),Ladders(currentPosition+diceValue),laddersFaced+1,Moved_up_a_Ladder,{Game_not_over} [] not(currentPosition+diceValue: dom(Ladders)) ==> (currentPosition+diceValue = WinPosition ==> route,currentPosition,message,gameStatus:=route<-currentPosition+diceValue,currentPosition+diceValue,Game_FINISHED_and_WON,{Game_Won} [] not(currentPosition+diceValue = WinPosition) ==> route,currentPosition,message,gameStatus:=route<-currentPosition+diceValue,currentPosition+diceValue,Moved_to_a_Normal_Square,{Game_not_over})))) [] not(currentPosition+diceValue<=WinPosition) ==> message,gameStatus:=Value_is_too_high_to_FINISH,{Game_not_over});
  List_Substitution(Machine(Snakes_Ladders),DiceRoll)==(IF currentPosition+diceValue<=WinPosition THEN lastDiceValue:=diceValue || turnsCount:=turnsCount+1 || IF currentPosition+diceValue: dom(Snakes) THEN route:=route<-currentPosition+diceValue<-Snakes(currentPosition+diceValue) || currentPosition:=Snakes(currentPosition+diceValue) || snakesFaced:=snakesFaced+1 || message:=Moved_down_a_Snake || gameStatus:={Game_not_over} ELSIF currentPosition+diceValue: dom(Ladders) THEN route:=route<-currentPosition+diceValue<-Ladders(currentPosition+diceValue) || currentPosition:=Ladders(currentPosition+diceValue) || laddersFaced:=laddersFaced+1 || message:=Moved_up_a_Ladder || gameStatus:={Game_not_over} ELSIF currentPosition+diceValue = WinPosition THEN route:=route<-currentPosition+diceValue || currentPosition:=currentPosition+diceValue || message:=Game_FINISHED_and_WON || gameStatus:={Game_Won} ELSE route:=route<-currentPosition+diceValue || currentPosition:=currentPosition+diceValue || message:=Moved_to_a_Normal_Square || gameStatus:={Game_not_over} END ELSE message:=Value_is_too_high_to_FINISH || gameStatus:={Game_not_over} END);
  List_Substitution(Machine(Snakes_Ladders),GameStat)==(playerPosition:=Current_Position|->currentPosition || snakesCount:=No_of_SNAKES_faced|->snakesFaced || laddersCount:=No_of_LADDERS_faced|->laddersFaced || turnsNum:=No_of_Turns|->turnsCount);
  List_Substitution(Machine(Snakes_Ladders),VisitedSquares)==(visitedPath:=route);
  List_Substitution(Machine(Snakes_Ladders),NewGame)==(currentPosition:=1 || snakesFaced:=0 || laddersFaced:=0 || turnsCount:=0 || lastDiceValue:=0 || route:=[StartPosition] || gameStatus:={} || message:=Start_a_new_GAME)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Snakes_Ladders))==(Board,Snakes,Ladders,StartPosition,WinPosition);
  Inherited_List_Constants(Machine(Snakes_Ladders))==(?);
  List_Constants(Machine(Snakes_Ladders))==(Board,Snakes,Ladders,StartPosition,WinPosition)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Snakes_Ladders),MESSAGES)==({Moved_to_a_Normal_Square,Moved_down_a_Snake,Moved_up_a_Ladder,Value_is_too_high_to_FINISH,Game_FINISHED_and_WON,Start_a_new_GAME});
  Context_List_Enumerated(Machine(Snakes_Ladders))==(?);
  Context_List_Defered(Machine(Snakes_Ladders))==(?);
  Context_List_Sets(Machine(Snakes_Ladders))==(?);
  List_Valuable_Sets(Machine(Snakes_Ladders))==(?);
  Inherited_List_Enumerated(Machine(Snakes_Ladders))==(?);
  Inherited_List_Defered(Machine(Snakes_Ladders))==(?);
  Inherited_List_Sets(Machine(Snakes_Ladders))==(?);
  List_Enumerated(Machine(Snakes_Ladders))==(MESSAGES,STAT_ALERTS,GAME_STATE);
  List_Defered(Machine(Snakes_Ladders))==(?);
  List_Sets(Machine(Snakes_Ladders))==(MESSAGES,STAT_ALERTS,GAME_STATE);
  Set_Definition(Machine(Snakes_Ladders),STAT_ALERTS)==({Square_Occupy,Current_Position,No_of_SNAKES_faced,No_of_LADDERS_faced,No_of_Turns});
  Set_Definition(Machine(Snakes_Ladders),GAME_STATE)==({Game_Won,Game_not_over})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Snakes_Ladders))==(?);
  Expanded_List_HiddenConstants(Machine(Snakes_Ladders))==(?);
  List_HiddenConstants(Machine(Snakes_Ladders))==(?);
  External_List_HiddenConstants(Machine(Snakes_Ladders))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Snakes_Ladders))==(btrue);
  Context_List_Properties(Machine(Snakes_Ladders))==(btrue);
  Inherited_List_Properties(Machine(Snakes_Ladders))==(btrue);
  List_Properties(Machine(Snakes_Ladders))==(Board <: NAT1 & Board = 1..100 & Snakes = {31|->4,16|->13,47|->25,63|->60,66|->52,97|->75} & Ladders = {3|->39,10|->12,27|->53,56|->84,72|->90,61|->99} & StartPosition = 1 & WinPosition = 100 & MESSAGES: FIN(INTEGER) & not(MESSAGES = {}) & STAT_ALERTS: FIN(INTEGER) & not(STAT_ALERTS = {}) & GAME_STATE: FIN(INTEGER) & not(GAME_STATE = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Snakes_Ladders),DiceRoll)==(?);
  List_ANY_Var(Machine(Snakes_Ladders),GameStat)==(?);
  List_ANY_Var(Machine(Snakes_Ladders),VisitedSquares)==(?);
  List_ANY_Var(Machine(Snakes_Ladders),NewGame)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Snakes_Ladders)) == (Board,Snakes,Ladders,StartPosition,WinPosition,MESSAGES,STAT_ALERTS,GAME_STATE,Moved_to_a_Normal_Square,Moved_down_a_Snake,Moved_up_a_Ladder,Value_is_too_high_to_FINISH,Game_FINISHED_and_WON,Start_a_new_GAME,Square_Occupy,Current_Position,No_of_SNAKES_faced,No_of_LADDERS_faced,No_of_Turns,Game_Won,Game_not_over | ? | gameStatus,lastDiceValue,route,turnsCount,laddersFaced,snakesFaced,currentPosition | ? | DiceRoll,GameStat,VisitedSquares,NewGame | ? | ? | ? | Snakes_Ladders);
  List_Of_HiddenCst_Ids(Machine(Snakes_Ladders)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Snakes_Ladders)) == (Board,Snakes,Ladders,StartPosition,WinPosition);
  List_Of_VisibleVar_Ids(Machine(Snakes_Ladders)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Snakes_Ladders)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Snakes_Ladders)) == (Type(MESSAGES) == Cst(SetOf(etype(MESSAGES,0,5)));Type(STAT_ALERTS) == Cst(SetOf(etype(STAT_ALERTS,0,4)));Type(GAME_STATE) == Cst(SetOf(etype(GAME_STATE,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Snakes_Ladders)) == (Type(Moved_to_a_Normal_Square) == Cst(etype(MESSAGES,0,5));Type(Moved_down_a_Snake) == Cst(etype(MESSAGES,0,5));Type(Moved_up_a_Ladder) == Cst(etype(MESSAGES,0,5));Type(Value_is_too_high_to_FINISH) == Cst(etype(MESSAGES,0,5));Type(Game_FINISHED_and_WON) == Cst(etype(MESSAGES,0,5));Type(Start_a_new_GAME) == Cst(etype(MESSAGES,0,5));Type(Square_Occupy) == Cst(etype(STAT_ALERTS,0,4));Type(Current_Position) == Cst(etype(STAT_ALERTS,0,4));Type(No_of_SNAKES_faced) == Cst(etype(STAT_ALERTS,0,4));Type(No_of_LADDERS_faced) == Cst(etype(STAT_ALERTS,0,4));Type(No_of_Turns) == Cst(etype(STAT_ALERTS,0,4));Type(Game_Won) == Cst(etype(GAME_STATE,0,1));Type(Game_not_over) == Cst(etype(GAME_STATE,0,1));Type(Board) == Cst(SetOf(btype(INTEGER,"[Board","]Board")));Type(Snakes) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(Ladders) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(StartPosition) == Cst(btype(INTEGER,?,?));Type(WinPosition) == Cst(btype(INTEGER,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Snakes_Ladders)) == (Type(gameStatus) == Mvl(SetOf(etype(GAME_STATE,?,?)));Type(lastDiceValue) == Mvl(btype(INTEGER,?,?));Type(route) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(turnsCount) == Mvl(btype(INTEGER,?,?));Type(laddersFaced) == Mvl(btype(INTEGER,?,?));Type(snakesFaced) == Mvl(btype(INTEGER,?,?));Type(currentPosition) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Snakes_Ladders)) == (Type(NewGame) == Cst(etype(MESSAGES,?,?),No_type);Type(VisitedSquares) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)),No_type);Type(GameStat) == Cst(etype(STAT_ALERTS,0,4)*btype(INTEGER,?,?)*(etype(STAT_ALERTS,0,4)*btype(INTEGER,?,?))*(etype(STAT_ALERTS,0,4)*btype(INTEGER,?,?))*(etype(STAT_ALERTS,0,4)*btype(INTEGER,?,?)),No_type);Type(DiceRoll) == Cst(etype(MESSAGES,?,?),btype(INTEGER,?,?)));
  Observers(Machine(Snakes_Ladders)) == (Type(VisitedSquares) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)),No_type);Type(GameStat) == Cst(etype(STAT_ALERTS,0,4)*btype(INTEGER,?,?)*(etype(STAT_ALERTS,0,4)*btype(INTEGER,?,?))*(etype(STAT_ALERTS,0,4)*btype(INTEGER,?,?))*(etype(STAT_ALERTS,0,4)*btype(INTEGER,?,?)),No_type))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
