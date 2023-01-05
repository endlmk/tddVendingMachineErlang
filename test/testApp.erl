-module(testApp).
-include_lib("eunit/include/eunit.hrl").

insertCoin_test() ->
    VM = vendingMachine:initMachine(),
    {Drink1, VM1} = VM(["buy", "Coke"]),
    ?assertEqual("", Drink1),
    VM2 = VM1(["insert", "100yen"]),
    {Drink2, VM3} = VM2(["buy", "Coke"]), 
    ?assertEqual("Coke", Drink2),
    {Drink3, _} = VM3(["buy", "Coke"]), 
    ?assertEqual("", Drink3).

buyOolong_test() ->
    VM1 = vendingMachine:initMachine(),
    VM2 = VM1(["insert", "100yen"]),
    {Drink1, VM1} = VM2(["buy", "Oolong"]),
    ?assertEqual("Oolong", Drink1).