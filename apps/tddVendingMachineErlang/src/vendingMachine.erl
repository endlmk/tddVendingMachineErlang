-module(vendingMachine).

-export([initMachine/0]).

initMachine() -> create(0).

create(Amount) -> 
    fun(Message) ->
        case Message of
            ["buy", Drink]  -> 
                if 
                    Amount >= 100 -> {Drink, create(Amount - 100)};
                    true -> {"", create(Amount)}
                end;
            ["insert", "100yen"] -> create(Amount + 100)
        end
    end.
