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
        isDead = player.health == 0
        isDeadAndHighLevel = isDead && player.level >= 10
    in
        case player of 
            isDeadAndHighLevel -> 
                {player | health = 100, mana = 100}

            isDead -> 
                {player | health = 100, mana = Nothing}

            not isDead -> 
                Nothing
        

castSpell : Int -> Player -> ( Player, Int )
castSpell manaCost player =
    let
        successfulSpell = manaCost =< player.mana
        damage = manaCost * 2
        noMana = player.mana == Nothing || player.mana == 0
        remainingMana = player.mana - manaCost
        insufficientMana = manaCost > player.mana && player.mana > 0 
    in
        case player of
            succesfulSpell -> ({player | mana = remainingMana }, damage)
            noMana -> ({player | health = player.health - manaCost}, Nothing)
            insufficientMana -> Nothing
