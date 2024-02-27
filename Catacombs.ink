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
VAR ENEMY_HP = 8
VAR TURNS_DEFENDING = 0
VAR TURNS_ATTACKING = 0
VAR TEMP_DMG = 0
VAR IS_DEFENDING = false
-> fight_intro

=== friendly_with_humans ===
As they back away from you, they start to put down their weapons. It seems like they aren't hear to hurt you. As they begin to speak you wonder if you will be able to trust them.
+ [Listen to what they have to say] -> listen_to_humans

=== aggressive_against_humans ===
The humans fall back and appear to be afraid of you. This might be your only chance in a long time to be able to stock back up on 
blood. You are starting to feel a bit more weak, there hasn't been a chance to get a good meal in a long time. As you take out one
of your empty vials to take what you can, you hear one of the humans attempt to speak.
+ [Listen to what they have to say]
    -> listen_to_humans
+ [Ignore what they have to say]
    -> continue_further_in_catacombs

=== fight_intro ===
-> fight_main

=== fight_main ===
= turn_hero
What will you do?
+ [Attack]
    You attack the humans for {player_acts(true)} damage.
    {
        - TURNS_ATTACKING >= 3:
            -> aggressive_against_humans
        -else:
            { The enemies seem to wince | The enemies appear to be getting more tired | The enemies start to back away }
            -> turn_monster
    }
+ [Defend] 
    ~ player_acts(false)
    You defend.
    -> turn_monster
= turn_monster
{ ENEMY_HP <= 0:
    The humans seem fairly hurt and try to back away as far as possible from you.
    -> fight_end
- else:
    The humans attacks...
    { IS_DEFENDING:
        ~TURNS_DEFENDING = TURNS_DEFENDING + 1
        {
            - TURNS_DEFENDING >= 3:
                -> friendly_with_humans
            -else:
                { You sense that the humans are scared of you | The humans seem to be more reluctant | The humans start to back away}
        }
        
    - else:
    You receive 1 damage!
    ~ HERO_HP = HERO_HP - 1
    }
    -> turn_hero
}

=== fight_end ===
-> aggressive_against_humans


=== function player_acts(is_attacking) ===
    ~ temp damage = 0
    {
        - is_attacking:
            ~IS_DEFENDING = false
            ~ damage = RANDOM(1, 4)
            ~ ENEMY_HP = ENEMY_HP - damage
            ~ TURNS_ATTACKING = TURNS_ATTACKING + 1
        - else:
            ~ IS_DEFENDING = true
    }
    ~ return damage