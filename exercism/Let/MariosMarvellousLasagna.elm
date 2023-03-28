module MariosMarvellousLasagna exposing (remainingTimeInMinutes)

remainingTimeInMinutes layers numberInMinutes =
    let
        expectedMinutesInOven = 40

        preparationTimeInMinutes layers = layers * 2 
    in
        remainingTimeInMinutes layers ovenTime = preparationTimeInMinutes layers + expectedMinutesInOven