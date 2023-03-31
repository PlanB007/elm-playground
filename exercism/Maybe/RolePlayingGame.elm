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
                Just {player | health = 100, mana = Just 100}

            else if isDead then 
                Just {player | health = 100, mana = Nothing}

            else if isAlive then
                Nothing
            else 
                Just player 
        

castSpell : Int -> Player -> ( Player, Int )
castSpell manaCost player =
    case player.mana of
        Nothing -> ({player | health = (max 0 <| player.health - manaCost)}, 0)
        Just remainingMana -> 
            if remainingMana >= manaCost then
                ({player | mana = Just (remainingMana - manaCost)}, manaCost * 2)
            else
                (player, 0)
