-module(testApp).
-include_lib("eunit/include/eunit.hrl").

buy_test() -> 
    ?assertEqual("coke", vendingMachine:buy()).

insertCoin_test() ->
    VendingM = vendingMachine:initMachine(),
    ?assertEqual("", VendingM("buy")),
    VendingM = vendingMachine:initMachine(),
    VendingM2 = VendingM("insert100yen"),
    ?assertEqual("coke", VendingM2("buy")).

