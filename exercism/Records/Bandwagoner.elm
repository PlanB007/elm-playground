module Bandwagoner exposing (..)

-- TODO: please define a type alias for the 'Coach' record
type alias Coach = 
    {
        name : String
        , formerPlayer : Bool
    }
-- TODO: please define the 'Stats' record
Stats : { wins: Int, losses: Int}

-- TODO: please define the 'Team' record
Team : { name: String, coach: Coach, stats: Stats}

replaceCoach newCoach team =
    {team | coach = newCoach}

createTeam : String -> Stats -> Coach -> Team
createTeam name stats coach =
    {
        name = name
        , stats = stats
        , coach = coach
    }



-- TODO: use an extensible record to accept any record that has a `stats: Stats` field
-- TODO: use pattern matching in the function parameter to get the `stats` field from the record

rootForTeam : {a | stats : Stats}
rootForTeam team =
    Debug.todo "Please implement this function, try to pattern match in the function parameter"
