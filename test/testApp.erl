-module(testApp).
-include_lib("eunit/include/eunit.hrl").

buy_test() -> 
    ?assertEqual("coke", vendingMachine:buy()).

insertCoin_test() ->
    VM = vendingMachine:initMachine(),
    {Drink1, VM1} = VM("buy"),
    ?assertEqual("", Drink1),
    VM2 = VM1("insert100yen"),
    {Drink2, VM3} = VM2("buy"), 
    ?assertEqual("coke", Drink2),
    {Drink3, _} = VM3("buy"), 
    ?assertEqual("", Drink3).

