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
    {Drink1, _} = VM2(["buy", "Oolong"]),
    ?assertEqual("Oolong", Drink1).

buyRedbul_test() ->
    VM1 = vendingMachine:initMachine(),
    VM2 = VM1(["insert", "100yen"]),
    {Drink1, VM3} = VM2(["buy", "Redbul"]),
    ?assertEqual("", Drink1),
    VM4 = VM3(["insert", "100yen"]),
    {Drink2, _} = VM4(["buy", "Redbul"]),
    ?assertEqual("Redbul", Drink2).

lightUp_test() ->
    VM1 = vendingMachine:initMachine(),
    ?assertEqual(false, VM1(["lightUp", "Coke"])),
    ?assertEqual(false, VM1(["lightUp", "Redbul"])),
    VM2 = VM1(["insert", "100yen"]),
    ?assertEqual(true, VM2(["lightUp", "Coke"])),
    ?assertEqual(false, VM2(["lightUp", "Redbul"])),
    VM3= VM2(["insert", "100yen"]),
    ?assertEqual(true, VM3(["lightUp", "Oolong"])),
    ?assertEqual(true, VM3(["lightUp", "Redbul"])).

insertCoins_test() -> 
    VM1 = vendingMachine:initMachine(),
    VM2 = VM1(["insert", "10yen"]),
    VM3 = VM2(["insert", "50yen"]),
    VM4 = VM3(["insert", "50yen"]),
    {Drink1, VM5} = VM4(["buy", "Oolong"]),
    ?assertEqual("Oolong", Drink1),
    VM6 = VM5(["insert", "500yen"]),
    ?assertEqual(true, VM6(["lightUp", "Redbul"])).

