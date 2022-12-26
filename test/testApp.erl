-module(testApp).
-include_lib("eunit/include/eunit.hrl").

length_test() -> ?assert(length([1,2,3]) =:= 3).
