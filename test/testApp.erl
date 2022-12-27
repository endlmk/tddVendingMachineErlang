-module(testApp).
-include_lib("eunit/include/eunit.hrl").

buy_test() -> 
    ?assertEqual("coke", vendingMachine:buy()).
