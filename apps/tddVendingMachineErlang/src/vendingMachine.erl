-module(vendingMachine).

-export([initMachine/0]).

initMachine() -> create(0).

create(Amount) -> 
    fun(Message) ->
        case Message of
            ["buy", Drink]  ->
                case Drink of
                    "Coke" -> if Amount >= 100 -> {Drink, create(Amount - 100)};
                                 true -> {"", create(Amount)}
                              end;
                    "Oolong" -> if Amount >= 100 -> {Drink, create(Amount - 100)};
                                   true -> {"", create(Amount)}
                                end;    
                    "Redbul" -> if Amount >= 200 -> {Drink, create(Amount - 200)};
                                    true -> {"", create(Amount)}
                                end
                end;
            ["insert", "100yen"] -> create(Amount + 100)
        end
    end.
