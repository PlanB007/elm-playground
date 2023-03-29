module MariosMarvellousLasagna exposing (remainingTimeInMinutes)

remainingTimeInMinutes layers numberInMinutes =
    let
        expectedMinutesInOven = 40

        preparationTimeInMinutes l = l * 2
    in
        preparationTimeInMinutes layers + expectedMinutesInOven - numberInMinutes