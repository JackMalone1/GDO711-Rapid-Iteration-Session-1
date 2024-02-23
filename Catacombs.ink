=== catacombs ===
# CLEAR
Your eyes take a second to adjust to the lower level of light down here. Your heart rate starts to slow down a bit as you realise
<> that you should be safe for a while.
+ Pause to catch your breath
    -> hear_faint_talking
+ Cautiously keep moving forward
    -> caught_off_guard
-> ending


=== hear_faint_talking ===
You start to take some time to yourself
+ Wait some more -> hear_faint_talking
+ [{Start fiddling with your blood vials | Check your bag for supplies | Scratch your head }] -> hear_faint_talking
+ Continue on 
    -> faint_talking

=== faint_talking ===
You start to hear some faint talking. You were fairly sure that you had made this area clear of regular humans last week, what are they doing here? They haven't appeared to have seen you so hopefully you should be able to catch them off guard.
+ Call out to them.
    ** "You shouldn't be here"
        "We're not here to try and hurt you. We want to make a deal with you".
        *** "I don't trust you"
    ** "You need to leave now"
        "We're not here to try and hurt you. We want to make a deal with you".
        *** "I don't trust you"
    ** "Back away now and I won't hurt you"
        "We don't want any trouble we're here to warn you."
        *** "I don't trust you"
    - -> caught_off_guard
+ Try to ambush them.
    -> caught_off_guard
+ Wait where you are.
    -> caught_off_guard
-> ending

=== caught_off_guard ===
{
    - TURNS_SINCE(-> faint_talking) == 0:
        You wait where you are when you see two people walk towards where you are.
    - TURNS_SINCE(-> faint_talking) < 5:
        You don't see any other way of getting past these two without fighting them.
    - else:
        You get caught offguard as you see two people walk towards you. You were almost certain that there shouldn't be anyone down here.
}
VAR HERO_HP = 10
VAR ENEMY_HP = 3
VAR TEMP_DMG = 0
VAR IS_DEFENDING = false
-> fight_intro


=== fight_intro ===
-> fight_main

=== fight_main ===
= turn_hero
What will you do?
+ [Attack]
    You attack the humans for {player_acts(true)} damage.
    -> turn_monster
+ [Defend] 
    ~ player_acts(false)
    You defend.
    -> turn_monster
= turn_monster
{ ENEMY_HP <= 0:
    The humans Died!
    -> fight_end
- else:
    The humans attacks...
    { IS_DEFENDING:
        You receive 0 damage!
    - else:
    You receive 1 damage!
    ~ HERO_HP = HERO_HP - 1
    }
    -> turn_hero
}

=== fight_end ===
-> ending


=== function player_acts(is_attacking) ===
    ~ temp damage = 0
    {
        - is_attacking:
            ~IS_DEFENDING = false
            ~ damage = RANDOM(1, 4)
            ~ ENEMY_HP = ENEMY_HP - damage
        - else:
            ~ IS_DEFENDING = true
    }
    ~ return damage