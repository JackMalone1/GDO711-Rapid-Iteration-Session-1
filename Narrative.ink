INCLUDE Catacombs.ink
# theme: dark
# author: Jack Malone


LONDON, 1842
Residence of Thana Jones.
-> intro

=== intro ===
You continue to  pack what little supplies that you can into your backpack, feviourisly looking around you. You hear a
sudden crash as a gust of wind knocks down a vase near the open window. The shattered remains lay down in a ray of light.
* You brush up the brocken remains.
    You wince slightly as the light hurts your skin as you reach for the broken pieces.
    -> clear_vase
* You leave quickly with the few items you were able to stuff into your backpack. -> rush_downstairs

=== clear_vase ===
You quickly clear the vase away, not trying to think of the pain. You still have some time before you have to try and hide
so attempting to cover your tracks should buy you some time. As you finish clearing away as much as you can you glance at your hand.

"Nothing that drinking some blood later should help clear up" you mutter to yourself.

You slowly make your way over to the entrance to the catacombs so that you can hopefully not be noticed, it's starting to get a bit
<> too bright outside.
-> go_downstairs

=== rush_downstairs ===
There's not enough time to clear away the evidence of where you've been before they find you. The light up here is already getting
too much for you to be able to survive, looking at the vials on your waste, you only have enough blood to last you a few more days.
What you have with you know will have to do. You hastely close your bag and make your way to the entrance of the catacombs.
->go_downstairs


=== go_downstairs ===
 {
 - TURNS_SINCE(-> clear_vase) == 0: 
    As you reach the stairs, you think you've managed to hide your tracks this far.
 - else:
    As you reach the top of the stairs, you begin to feel out of breath but it seems like you've managed to get here before anyone
    <> was able to track you.
 } 

You take a moment to catch your breath. Even thought the coast is clear for now you know that the villagers won't be far behind.

You begin to close your eyes. You appear to be safe for now. As you go down the stairs you make sure to cover back over the entrance,
<> for a regular human it should be a lot more difficult to notice the slight variation in this part of the wall.
* You decide to fully enter the catacombs
    -> catacombs

=== ending

-> END

=== function came_from(-> x)
	~ return TURNS_SINCE(x) == 0