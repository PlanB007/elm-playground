module RolePlayingGame exposing (Player, castSpell, introduce, revive)


type alias Player =
    { name : Maybe String
    , level : Int
    , health : Int
    , mana : Maybe Int
    }


introduce : Player -> String
introduce { name } =
    case name of
        Nothing -> "Mighty Magician"
        Just someName -> someName


revive : Player -> Maybe Player
revive player =
    let
        isAlive = player.health > 0
        isDead = player.health == 0
        isDeadAndHighLevel = isDead && player.level >= 10
    in
            if isDeadAndHighLevel then 
                {player | health = 100, mana = 100}

            else if isDead then 
                {player | health = 100, mana = Nothing}

            else
                Nothing
        

castSpell : Int -> Player -> ( Player, Int )
castSpell manaCost player =
    let
        successfulSpell = manaCost <= player.mana
        damage = manaCost * 2
        noMana = player.mana == Nothing || player.mana == 0
        remainingMana = player.mana - manaCost
        insufficientMana = manaCost > player.mana && player.mana > 0 
    in
        if successfulSpell then 
             ({player | mana = remainingMana }, damage)
        else if noMana then
            ({player | health = player.health - manaCost}, 0)

        else
            (player, 0)
            
