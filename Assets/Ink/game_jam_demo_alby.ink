EXTERNAL skeletonAnimationTrigger(animation)
EXTERNAL skeletonAnimationFloat(animation, value)
EXTERNAL skeletonAnimationBool(animation, value)
EXTERNAL treeAnimationBool(animation, value)
EXTERNAL gameOver()
EXTERNAL restart()

~ skeletonAnimationTrigger("GotoHouse")
~ skeletonAnimationBool("Dead", false)
~ skeletonAnimationFloat("BrodyPercent", 0)
~ skeletonAnimationFloat("RattlePercent", 0)
~ treeAnimationBool("TreeFallDown", false)

Controls: Space to advance text, left mouse button to select a choice, alt f4 to exit
* [Begin]
-> intro

=== ending ===
~ gameOver()
Wow, what an ending? But what if you could go back? What would you do? What would you change?

Do you want to play again?

 * [Yes]
~ restart()
-> END


=== intro ===

Once upon a time...
~ skeletonAnimationFloat("BrodyPercent", 0.5)
This is the tale of Lord Viscount Destin Esquire, The Dapper Cadaver.

* [What is a Dapper Cadaver?] How should I know?

- Destin spends his days sitting in his fancy mansion. The Lord Viscount walks around with his fancy robes and lack of flesh. Because Destin is also a skeleton.

	Are you ready to listen to his grand adventure?


* [Yes]
    -> Yes
* [No]
    -> No

 
=== No ===

~ skeletonAnimationFloat("BrodyPercent", 0)
~ skeletonAnimationBool("Dead", true)
Screw you!

Why are you even playing this game? A filthy commoner like you doesn't deserve Lord Destin's greatness. It took many bards to craft his legendary tale. Shame on you. This is the most important story in the entire world. And yet you scoff at it as you know better.

Have fun with your life. You don't know what you're missing out on.

-> ending

=== Yes ===

Lord Destin lived in a magnificent mansion, one so grandiose that it made other mansions weep tears of insecurity. As opulent as his abode in the woodlands was, Destin lived alone. While this isolation granted Destin a wonderful amount of space between him and detestable humans that oh-so-hated skeletons such as himself, he always wondered what it would be like to live life as human.

* Destin sighed [] and took a puff of his pipe, simultaneously cursing and praising the cruel yet generous fate that had befallen and blessed him.

-  familiar memory flashed within his bones. A rumor along the howling winds long ago of a place where skeletons went to unwind danced behind his eye sockets. A place where skeletons could get drinks. A place where skeletons could hook up!

Desire swept Destin off his feet, a gnawing, ravenous yearning within him overtaking him in the process.

* A yearning[...] for the Arms and Legs Tavern.

- Before he knew it, Destin had his oh-so-stupendous stroll-wear on. As he stared into his reflection and watched it gaze flawlessly back into him, he started towards the exit, prepared to start his long, arduous journey.

But which exit would he take? 
	
 * [Go through the front door.]
    -> FrontDoor
* [Jump out the window.] 
    -> JumpOutWindow
+ [Go through the back door.]
    -> BackDoor
 
 ==FrontDoor==
 
~ skeletonAnimationTrigger("GotoDogs")
Destin exited through the front door. Why choose any other option? That would involve thinking. Remember best choices are made with no thought. Destin walked outside with no worries. Why should he be worried? He was Lord Viscount Destin Esquire, The Dapper Cadaver! All he had to do was enter the Arm and Leg Tavern. Then, he could be a living man once again. What could go wrong?

Hint: It's God spelled backward. That's right, the answer is -


-> Dog

=== Dog ===

Dog. Or to be more specific, Dogs.

A pack of dogs stood in front of Destin. He paused. Skeletons and dogs were natural enemies. It's the natural order. 

Saliva poured down the beast's mouth. Their teeth were sharp enough to crack a rib in half. How could humans tame them as pets? Everyone knew him as Lord Viscount Destin Esquire, The Dapper Cadaver. The dogs saw him as a walking meal. Even the puppies were a threat to the mightiest of skeletons.

And now they were staring straight at him.
* [Oh Shit...]
~ skeletonAnimationFloat("BrodyPercent", 0)
~ skeletonAnimationFloat("RattlePercent", 1)
Destin ran from the canine carnivores. That did little for him. He was a skeleton. The dogs tackled him down and pinned the poor skeleton. Destin screamed as the little doggies bit through his body. His bones were scattered all over the ground. 

The dogs feasted on his body like there was no tomorrow. And there was no tomorrow, for Destin. The once-mighty Lord Viscount was reduced to dust and bones.
~ skeletonAnimationFloat("RattlePercent", 0)
~ skeletonAnimationBool("Dead", true)
At least he was delicious.

-> ending

=== JumpOutWindow ===

Destin looked at all his options. The front door was too obvious. Only an idiot would barge right through without a plan. Destin thought up alternate travel routes. He searched all over until he found a window.

"That's it, the window," said Destin. "No one will find me there."

Destin jumped outside the window like a madman. The crash caught the attention of many animals. Glass rained down like solid water drops. Destin's skeletal body ignored the glass cuts. But he forgot one thing.

* [Gravity.]

- {skeletonAnimationTrigger("GotoDogs")}
The force of gravity broke Destin to pieces. It splattered his bones all over the ground. Destin shouted as he searched for his body. How could he be so stupid? Even a skeleton-like him couldn't defy the magic of gravity. The crashing sound caught the attention of many animals. How could things get any worse?

Hint: It starts with a d and ends with a g.

 
  -> Dog
 
 
=== BackDoor ===

Destin heard some dogs barking earlier. If he went from the front door, the dogs might chase him. He could try jumping out the window. The gravity would kill him if not the dogs. Destin sat down and reconsidered his options.


"I should have kept a backup plan," said Destin. "How silly of me, I'll just use the back."

~ skeletonAnimationTrigger("GotoTree")
So Destin went outside to the back door. A place he almost forgot existed. The dogs circled around the mansion, like wolves with their prey. They didn't notice Destin running off with his bare bone legs. 

Only a big dummy would pick the other directions. Destin recalled the path to the Arms and Legs Tavern. All he had to do was pass the riverbank and follow the stream. Then, his journey would be smooth sailing (at least if he had a boat).

* [Destin arrived at the riverbank]

- The flowers were singing and shaking their heads. Woodland animals hugged each other as all best friends did. The grass was so green Destin forgot other colors existed. Baby ducks cuddled near their mothers as they swam away. 

The river curved, jumped, and back flipped all over the place. This riverbank came straight from a drawing. The dread and gloom in his forest turned to rainbows and sunshine. Everything was so happy and full of life.

It made Destin sick. He almost died from all the cuteness. Or died again in this case. Destin paused and searched the surrounding area. He didn't realize how much progress he made.

"Yes! I'm already halfway there," said Destin. "And I did it all by myself, like a big boy."

Destin felt a strange pride in him. All his afterlife. Is this what commoners felt like? This pride of doing things by one's own actions. What if there's more to life than being Lord Viscount?

"Nonsense. Being Lord Viscount is the best thing ever," Destin said, dismissing such thoughts. "It will be even better once I reach the Arm and Leg Tavern.


Destin arrived at the ancient riddle. He expected a clever riddle that would test his intelligence and wisdom. What he found wasn't half as fun.

* [Here it was, the ancient riddle.]


- Timmy and Susie were playing on the riverbank. They wanted to see which river route was the fastest. They denoted their speed when travelling in water with variable x. On two separate days, Timmy travelled each of the streams for 10 minutes. 

When he went upstream, his speed was x -- 3. When he went downstream, his speed was x  + 3. Susie jotted down the speed rates and made comparisons. She took the rivers positing and slope into consideration when comparing the two routes.

Which route is the slowest among the two? Explain your reasoning by following the route. Only then will you reach the Arms and Legs Tavern.

Destin dropped his jaw. He pushed it back up after regaining his senses. This was a math problem, not a magical riddle .Math wasn't Destin's strong suit, he's never been to school before. If only he had a human body to blend in with the other kids. 

Speaking of kids, what were Timmy and Susie thinking? They should be playing games, not performing experiments. The mansion escape tested his guile. This math question tested his logic. Destin had to rely on his brains. Even though he doesn't have any. He only had two options.

Which route was slower? Upstream or downstream?


But with a bit of logic, he could overcome the problem.


 +[Go upstream] 
     -> Upstream
* [Chop down the tree] 
     -> ChopDownTree
* [Go downstream]
    -> DownStream


==Upstream==


<> Destin got in touch with his inner nerd. He examined the question and focused on two words. Positioning and slope. He thought back to all the times he walked around the mountain. Riding down was much more fun than riding upward. But he didn't understand it until he saw the slope.

When going downwards, the boat and the water move in the same direction. The speed is more than what it will be when the two are moving opposite to each other. In other words, the upstream motion is slower.

"Going down is super fast because of the slope," said Destin in much simpler words. "So going up must be slower."

Destin ran straight upstream, sure of his choice. That had to be the right answer. Why else would he be so exhausted walking? Riddles force you to take the hard path, even when it's math. The variable of his walking speed was x-1000. He regained some energy once he saw the tavern. He got the right answer.

"I did it!" Destin shouted. "Take that math!"

* [Arrive at the Arm and Leg Tavern]
       -> ArmAndLegTavern

=== ArmAndLegTavern ===

~ skeletonAnimationTrigger("GotoTavern")
<> Here he was, the Arm and Leg Tavern.

The Arm and Leg tavern was a carpool of criminal activity. A black market for thugs, fiends, and villains. The building's outer structure comprises stones and wooden pillars. Broken windows and a few graves all over. Nothing unusual for the great Lord Destin. From the outside, the tavern looked dark and dirty. The inside wasn't much better.

Squared wooden beams support the upper floor on the verge of snapping. The walls were covered in death threats and explicit messages. Some of them had to be censored for reader discretion. The few people inside were murderers. Destin was welcomed with watching eyes and the smell of alcohol. 

* [Approach the bartender] He approached the bartender who just coughed into a dirty napkin.

 - Everything about this place was deprived of any virtue. It almost made Destin cry out of joy. Once he had his new body, he could cry and smell all he wanted.

"Welcome to the Arm and Leg Tavern," said the barkeep. A tough macho man with the name "Mimi' written on his nametag. "We sell body parts here. Not with the drinks, of course." 

"I know that," said Destin. It was written on their front sign. "I would like to buy a full body please."

The bartender raised an eyebrow.

"Looks like we have a big spender here," said Mimi, the bartender. "Show me the money first.

Destin kept his coin pouch on the countertop. The pouch was so heavy it broke the table.

"This should be more than enough," Destin said with a skeletal smile. "Bring me your best parts. "

"Coming right up, sir," said the barkeep. "Pay for the broken table."

"Don't worry, I have that covered."

* [Receive a new body]

- And so, Mimi gave the skeleton a new body. Destin looked like a God in human form. All will fall before his gorgeous human looks. Power coursed through his new body.Now he had skin, flesh, and bones all in one body. It's like wearing three winter coats on a summer morning. Destin walked out of the Arm and Leg Tavern as a new man. Literally. 

"I can't believe I'm saying this. But this journey has taught me a valuable lesson," said Destin, checking his new body out. "I'm going to do things on my own from now on. That shouldn't be too hard in this new body."

~ skeletonAnimationFloat("RattlePercent", 999)

And so, Lord Viscount Destin Esquire, The Dapper Cadaver, lived happily ever after.

* [THE END (but like in a good way).]

-> ending

=== ChopDownTree ===

Screw this riddle. He came here to solve his body issues, not math problems. Destin would take a more practical approach.

Destin noticed a tree next to the riverbank. The one that wasn't singing about sunshine and rainbows. There was also an ax stuck on the bark. A forester must have left it there after being attacked by rabbits (lucky guess). Perfect. He could cut down the tree and make a bridge. Then, he could cross the river. 

"I came up with yet another brilliant plan," said Destin. "There's no possible way anything bad can happen."

* [Oh, sweet naïve skeleton.]

~ treeAnimationBool("TreeFallDown", true)

With a smile on his face, Destin approached the tree. He grabbed the axe and hacked right through it. The old Destin would never do grunt work. That's what servants are for. But desperate times called for desperate measures. Destin had to do things by himself, like a normal person. He had no experience with tree cutting. Not like that mattered. No flesh, no splinters. Destin chopped and hacked the tree until it fell.

"Timber!" shouted Destin as the tree collapsed on the riverbank. He always wanted to say that.

There's only one problem. The tree was too short.

Destin didn't think about it. He was too caught up in the tree chopping moment. Water exploded from the tree's impact. Destin expected it to be a natural bridge. Instead, it floated downstream like a premature boat. Destin chased after it but fell down moments after. His skeleton legs couldn't keep up with all this running. When Destin got up, the tree was gone. He curled up in a fetus position and moaned like a baby. What else could the skeleton do?

Looks like Destin got the short end of the tree.

-> ending

=== DownStream ===

Destine tried the math and failed miserably. He fidgeted with the numbers, questions, and words themselves. Nothing worked. After 15 minutes of solving the same problem, Destin gave up. Exhausted, he left his fate to the gods.

"I'll take a wild guess and go downstream," Destin said.  " Worst case scenario, I'm still 50 percent right."

Destin ran downstream without a moment's hesitation. He kept doubting if he made the right move or not. That didn't stop him from running further. As he ran, the stream grew shorter.That must mean Destin was right. It was so short, Destin could almost jump across it. But he kept running just in case.

The more Destin ran, the more he realized the error of his ways.

The downstream motion means that the boat and the stream or the river are going in the same direction. Therefore the speed of the boat will always be greater than the speed of the river.

That means downstream will be faster than upstream, not slower.

Destin didn't find the tavern in front. Instead, he found something much worse.

Hint: It's an animal humans love but cats hate.


-> Dog


