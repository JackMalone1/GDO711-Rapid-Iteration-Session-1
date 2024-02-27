=== continue_further_in_catacombs ===
{
    - TURNS_SINCE(-> hear_them_out) == 0:
        You seem to trust these villagers for now, but trying to convince the rest of the village to stay on your side long enough is going to be too much work. Staying down here is the only way to make sure that you can stay safe even if it puts everyone else at risk.
    - else:
        The villagers only seem to be trying to use you, it seems even as if these few have good intentions as soon as you finish helping them the village still won't be safe for you. It's easier to stay here for now instead of having to run again.
}
-> ending

=== listen_to_humans ===
{
    - TURNS_SINCE(-> friendly_with_humans) == 0:
        As you start to recover from the confrontation you try to see why they're here.
        -> hear_them_out
    - else:
        As they start to get back up, you wonder if they might be different from the other villagers that you had seen earlier. Maybe they'll not try to hurt you.
        -> confront_why_theyre_here
}


=== help_the_village ===
{
    - TURNS_SINCE(-> hear_them_out) == 0:
        Even though you do trust the villagers for now, you realise that if you are to help them that this is probably isn't going to turn out well.
    - else:
        You hesitantly decide to help, if only so that if things do turn out well they might be able to repay you in time.
}
-> ending

=== hear_them_out ===
+ ["Why are you here. No one from the village should be here"]
    "We're here to get your help. There's no one else that can help kill the monsters. If you don't help the entire village is going to die".
    These people seem different than the others that have been coming to try hunt you out of the town. You might be able to trust
    them, even just for now.
    ++["What's in it for me?"]
        "We can help you to make sure that no one else comes after you anymore. Plus we know that sooner or later you're going to have to come out of here anyway to get more blood, we may know a thing or two to help you with that as well. As long as you help us first".
        +++ ["I'll only help you for as long as you can help me."] -> help_the_village
        +++ ["You'll need to find someone else to help you. It's too dangerous for me to go out there."] -> continue_further_in_catacombs
    ++["What if I don't want to help? The rest of the town is trying to kill me."]
        "If you come and help us know we can help to clear your name, but you have to help us now. If we don't help the village now there's going to be no one left to prove you're not going to hurt them". They seem to not want to hurt you, but they still don't seem to be able to fully help you against the rest of the village.
        +++ ["I'll trust you for now, but if you can't help me you're on your own"] -> help_the_village
        +++ ["I'm not going to help until you can prove that you can help me."] -> continue_further_in_catacombs
+ ["You should get out of here now while you still can."]
    They appear to try and think of something to say, but as they hear the rest of the villagers in the mansion above, they decide to leave you here. Hopefully you still have enough time to make it to safety before they find you.
    ++ [continue on] -> continue_further_in_catacombs
            
=== confront_why_theyre_here ===
+ ["No one from the village has given me a reason to trust them. Why should I expect any different from you?"]
    "If you come and help us know we can help to clear your name, but you have to help us now. If we don't help the village now there's going to be no one left to prove you're not going to hurt them". They seem to not want to hurt you, but you still don't trust that they can actually help you against everyone else from the village.
    ++ ["You'll need to find someone else to help you. It's too dangerous for me to go out there."] -> continue_further_in_catacombs
    ++ ["I'll only help you for as long as you can help me."] -> help_the_village
+ ["You should get out of here now while you still can."]
    They appear to try and think of something to say, but as they hear the rest of the villagers in the mansion above, they decide to leave you here. Hopefully you still have enough time to make it to safety before they find you.
    ++ [continue on] -> continue_further_in_catacombs