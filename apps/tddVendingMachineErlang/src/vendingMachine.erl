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
    AmountOfCoin = fun(Coin) -> 
        case Coin of
            "10yen" -> 10;
            "50yen" -> 50;
            "100yen" -> 100;
            "500yen" -> 500
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
            ["insert", Coin] -> create(Amount + AmountOfCoin(Coin));
            ["lightUp", Drink] -> Amount >= Price(Drink)
        end
    end.
