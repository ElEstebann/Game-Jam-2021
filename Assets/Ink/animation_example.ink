EXTERNAL skeletonAnimationTrigger(animation)
EXTERNAL skeletonAnimationFloat(animation, value)
EXTERNAL skeletonAnimationBool(animation, value)

-> inside_house

=== inside_house ===
~ skeletonAnimationTrigger("GotoHouse")
~ skeletonAnimationBool("Dead", false)
Dustin is inside his house, he hears growls outside

* [walk outside] Dustin walks outside {skeletonAnimationTrigger("GotoDogs")}
    the dogs eat him {skeletonAnimationBool("Dead", true)}
     -> retry_inside_house
* [jump out window] Dustin jumps out the window {skeletonAnimationTrigger("GotoTree")}
    he dies due to fall damage {skeletonAnimationBool("Dead", true)}
     -> retry_inside_house
+ [go though back door] Destin walks out the back door {skeletonAnimationFloat("BrodyPercent", 0.3)}
    He goes outside {skeletonAnimationFloat("BrodyPercent", 1)} {skeletonAnimationTrigger("GotoTavern")}
    -> outside

=== retry_inside_house ===
+ [Retry?]
    Time rewinds...
    -> inside_house

=== outside ===
Destin is outside...
what happens next? {skeletonAnimationFloat("BrodyPercent", 0)} {skeletonAnimationFloat("RattlePercent", 1)}
-> END
