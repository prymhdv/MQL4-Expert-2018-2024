/*//-----Informed Search Hill_Climbing Search  Implementation ---    AI_IS_Hill_Climbing.mqh>//--the algoritm random access nodes -- can combinate with other//   --local optimum - global optimum
/*--------------------------------------------------------------------------------------/* jump from local optimum to next place to fine final general optimum
/******************************** basic
Procedure HillClimbing
generate a aSolution(s')
Best = S'
loop
S= Best
S'= Neighbors(S)
Best = SelectBest(S')
Until stop criterion satisfied
END
***********************************/
/******************************** Super
Procedure HillClimbing
generate a aSolution(s')
Best = S'
loop
S= Best
S'= Neighbors(S)
Best = SelectBest(S')
IF there is no change in best solution THEN
jump to new state in state space
Until stop criterion satisfied
END
***********************************/
//+------------------------------------------------------------------+
