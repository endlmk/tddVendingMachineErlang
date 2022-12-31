-module(vendingMachine).

-export([buy/0, initMachine/0]).

buy() -> "coke".

initMachine() -> create(0).

create(Amount) -> 
    fun(Message) ->
        case Message of
            "buy" -> 
                if 
                    Amount >= 100 -> "coke";
                    true -> ""
                end;
            "insert100yen" -> create(Amount + 100)
        end
    end.
