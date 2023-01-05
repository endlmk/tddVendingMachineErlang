-module(vendingMachine).

-export([initMachine/0]).

initMachine() -> create(0).

create(Amount) -> 
    Price = fun(Drink) ->
        case Drink of
            "Coke" -> 100;
            "Oolong" -> 100;
            "Redbul" -> 200
        end
    end,
    fun(Message) ->
        case Message of
            ["buy", Drink]  ->
                P = Price(Drink),
                if 
                    Amount >= P -> {Drink, create(Amount - P)};
                    true -> {"", create(Amount)}
                end;
            ["insert", "100yen"] -> create(Amount + 100)
        end
    end.
