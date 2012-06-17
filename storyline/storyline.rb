# encoding: utf-8
# storyline.rb defines the storyline for the game. the stories are written using the puts method and pause method.

# Helpful Methods
# pause  					waits for a carriage return from the user before proceeding forward.
# puts              		puts text to the screen as listed.
# clear_screen 				clears the screen
# encounter_boss			calls the next boss from data/data
# self.potions+=n			increases the number of potions the user has by n 
# self.location=''			defines the location of the player. note: this location changes automatically based on number of monsters killed.
# self.name   				when the player is speaking use self.name
# Spells[n].active_flag=1	this sets the next magical spell to be accessible by the user. spells are defined in data/data
# self.gold+=n 				adds n gold to the player

module Storyline
			def urselan 		#urselan defines the opening storyline in the game before a player has killed any monsters
			clear_screen
			puts "You see a disciple of Urselan. You think it unusual for a disciple to be in the streets."
			pause
			puts "You approach the disciple."
			puts "Figaro: I didn't know it would get like this..."
			puts "#{self.name}: ..."
			pause
			puts "Figaro: I'm tired. I should rest."
			puts "#{self.name}: Wait, what do you mean 'like this?"
			pause
			puts "Figaro: Arcania is beautiful. Filled with fortune and beauty."
			puts "Figaro: A harbor of evil..."
			pause
			puts "Figaro: Teachings spoke of one jewel powered by a #{self.role} to change the world."
			puts "#{self.name}: What jewel..."
			puts "Figaro: I can't tell you any more."
			puts "Figaro: Here, take this with you."
			gets
			self.potions+=1
			clear_screen
			puts "\e[1;31mYou received a potion!\e[0m"
			puts "#{self.name}: Thank you.."
			puts "Figaro: I recommend that you visit Amortia." 
			puts "Figaro: The elder there can provide something to help you."
			pause
			puts "#{self.name}: What is that?"
			puts "Figaro: I am tired now. I must go."
			puts "#{self.name}: Wait..."
			pause
			puts "The disciple turns and walks away."
			pause
			puts "In the streets you see fear in the townspeople's eyes."
			pause
			puts "You walk to Urselan's gates."
			self.location = "Urselan Forest"
			stats
			puts "You enter a new area, Urselan Forest. A monster comes closer."
			gets
			end
			def storyline_one 	#storyline_one (''_two, ''_three, ''_n, etc) define the messages the player receives when killing ''_n monsters
			puts "#{self.name}: Why have these forest animals become hostile..?"
			pause
			puts "#{self.name}: They seem possessed by something.."
			pause
			puts "A monster comes closer."
			end
			def storyline_two
			puts "Fire Fairie: You freed me!"
			pause
			puts "#{self.name}: Who are you?"
			pause
			puts "Fire Fairie: I will help you."
			puts "Fire Fairie: There are four others like me."
			pause
			puts "Fire Fairie: We can each teach you powerful spells."
			pause
			puts "Fire Fairie joins your party."
			puts "\e[1;31mYou learn the spell Fireball!\e[0m"
			Spells[2].active_flag = 1
			pause
			puts "Fire Fairie: Now we work together!"
			pause
			puts "A monster comes closer."
			end
			def storyline_three
			puts "You see a familiar face."
			pause
			puts "Dwarzengorf: #{self.name} it's been years since I've seen you in #{self.location}."
			pause
			puts "#{self.name}: As a child I came to #{self.location}.."
            puts "Dwarzengorf:  What brings you back to the Forest?"
            puts "#{self.name}: ..."
            pause
            puts "#{self.name}: What has possessed these creatures?"
            pause
            puts "Dwarzengorf: I've been wondering that myself."
            puts "Dwarzengorf: I've never had an issue with an Alkazar or Gorgon before."
            puts "Dwarzengorf: There is an elder in the City of Darcanthus who is known as Azgard."
            pause
            puts "Dwarzengorf: This elder is rumored to have a great power."
            puts "Dwarzengorf: The power to see into the future."
            pause
            puts "Dwarzengorf: There is something you should know."
			puts "Dwarzengorf: Elders are wise, but they can speak in riddles and lead those who listen mad."
            puts "Dwarzengorf: Maybe I can help. Take this and put it to good use."
            pause
            self.current_gold += 100
            puts "\e[1;31mYou gained 100 gold!\e[0m"
            pause
            puts "Dwarzengorf: Another monster is coming. I'm headed back to the village."
            puts "Dwarzengorf: Good luck!"
            pause
            puts "A monster comes closer."
			end
			def storyline_four
			puts "#{self.name}: I should travel to Darcanthus and engage the elder."
			puts "Fire Fairie: I'm going with you!"
			pause
			puts "#{self.name}: Let's go then."
			puts "A monster comes closer."
			end
			def storyline_five
			puts "#{self.name}: I would like to know how the five fairies were captured."
			puts "Fire Fairie: We weren't captured. The creatures we protect were captured."
			pause
			puts "#{self.name}: What do you mean?"
			puts "Fire Fairie: We share a life force with Arcania's creatures."
			puts "Fire Fairie: We are dispersed randomly to a creature and live with it until it dies."
			pause
			puts "Fire Fairie: The creatures we live with are not dead, they are possessed."
			puts "Fire Fairie: #{self.name}..."
			pause
			puts "Fire Fairie: Until you freed me it felt like my voice was being quieted."
			puts "A monster comes closer."
			end
			def storyline_six
			puts "Fire Fairie: Beware the Rankadon in these parts."
			puts "Fire Fairie: The Rankadon is a creature of brawn."
			pause
			puts "Fire Fairie: It moves very quickly and is very strong."
			puts "Fire Fairie: Oh no!"
			pause
			puts "#{self.name}: What's wrong?"
			puts "Fire Fairie: My warning may have been too late."
			puts "Fire Fairie: Look!"
			pause
			puts "The Rankadon blinks."
			pause
			puts "#{self.name}: This is the monster you warned me about!"
			pause
			puts "Fire Fairie: Let's run now and we can go around the creature."
			pause
			puts "#{self.name}: It is moving too fast!"
			pause
			puts "The monster has two arms and a giant head with beady eyes."
			puts "You think it strange this monster is here so close to your village."
			pause
			encounter_boss
			end
			def storyline_seven
			puts "#{self.name}: Was that monster possessed also?"
			puts "Fire Fairie: It is hard to say the Rankadon has always been aggressive."
			pause
			puts "#{self.name}: When the creature you lived with was possessed did you understand anything about its possessor?"
			puts "Fire Fairie: Understand... no."
			puts "Fire Fairie: I felt something."
			puts "Fire Fairie: Some kind of darkness unnatural to Arcania."
			pause
			puts "#{self.name}: We should travel to the other villages and see if they feel the same."
			puts "Fire Fairie: I used to be able to communicate with the other fairies."
			puts "Fire Fairie: I haven't been able to since the possession."
			pause
			puts "#{self.name}: Let's go."
			puts "A monster comes closer."
			end
			def storyline_eight
			puts "Figaro: #{self.name}... hear me."
			puts "#{self.name}: I hear you Figaro."
			pause
			puts "Figaro: The disciple's hall in Urselan has a historic stone."
			puts "Figaro: Disciples like myself have been trained to channel the stone's energy to establish a psychic connection."
			pause
			puts "Figaro: In the village I gave you a gift."
			puts "Figaro: Now I feel a dark presence drawing closer to our village."
			pause
			puts "Figaro: I fear someone or something is looking for you."
			puts "Figaro: I don't have much time. Listen carefully."
			pause
			puts "Figaro: Some entity is preparing an attack against Urselan."
			puts "You wonder how the disciple is aware of planned attacks."
			pause
			puts "Figaro: Defeating the Rankadon was a sign you learn very quickly."
			puts "#{self.name}: Yes..."
			puts "Figaro: Find the jewel and use it to thwart the power that threatens our village."
			pause
			puts "Figaro: You must travel onward and ahead is a powerful enemy."
			puts "You remember the final attack the rock monster Rankadon took before falling into the dirt."
			pause
			puts "Figaro: Myself and the other disciples here will use our combined energies to stop the presence coming to Urselan."
			puts "Figaro: On the outskirts of Urselan lies this powerful enemy. It is an apparition also known as a spirit."
			pause
			puts "Figaro: This spirit defends the path to the elder in Amortia where you must go."
			puts "Figaro: In order to cross you must defeat this apparition."
			pause
			puts "Figaro: I regret not training you now."
			puts "Figaro: Your father was a respected man amongst all of Darcanthus."
			puts "Figaro: And I resisted his wishes..."
			pause
			puts "Figaro: I cannot keep the connection open."
			pause
			puts "You see a monster coming closer."
			puts "For a first telephatic experience it felt familiar to you."
			end
			def storyline_nine
			puts "Familiar Voice: Hear me #{self.name}."
			pause
			puts "Familiar Voice: Our thoughts are one."
			pause
			puts "Familiar Voice: I have known you."
			pause
			puts "Familiar Voice: We will meet where the roads cross."
			pause
			puts "#{self.name}: That voice sounds so familiar..."
			pause
			puts "You hear nothing but silence."
			pause
			puts "#{self.name}: ?"
			pause
			puts "#{self.name}: That voice..."
			pause
			puts "#{self.name}: I must have heard it before somewhere."
			pause
			puts "Fire Fairie: I don't hear anything!"
			pause
			puts "You wonder if the familiar voice belongs to Figaro."
			puts "The voice could be Figaro's but it is difficult to tell for sure."
			pause
			puts "A monster comes closer."
			end
			def storyline_ten
			puts "Earth Fairie: You freed me!"
			pause
			puts "#{self.name}: Who are you?"
			pause
			puts "Earth Fairie: I will help you."
			puts "Earth Fairie: There are three others left to be freed like me."
			pause
			puts "Earth Fairie: We can each teach you powerful spells."
			pause
			puts "Earth Fairie joins your party."
			Spells[3].active_flag = 1
			puts "\e[1;31mYou learn the spell Roots!\e[0m"
			pause
			puts "Earth Fairie: Let's go!"
			pause
			puts "#{self.name}: I feel more powerful..."
			pause
			puts "A monster comes closer."
			end
			def storyline_eleven
			puts "Earth Fairie: I feel a presence nearby."
			puts "Fire Fairie: Be careful, #{self.name}!"
			pause
			puts "#{self.name}: I feel it as well."
			puts "#{self.name}: I felt this same presence once before."
			puts "You think back to when your father disappeared from Urselan."
			puts "It felt like your voice was lost."
			pause
			puts "You hear screaming up ahead."
			puts "The screams sounds like Dwarzengorf's."
			pause
			puts "Earth Fairie: Let's see where those screams are coming from."
			puts "A monster comes closer."
			end
			def storyline_twelve
			puts "#{self.name}: It's dark here."
			puts "#{self.name}: I cannot see but a few feet!"
			puts "Fire Fairie: I'll illuminate our path!"
			pause
			puts "\e[1;31mYou and your party are surrounded by light!\e[0m"
			pause
			puts "Dwarzengorf: No, no!"
			pause 
			puts "It's Dwarzengorf, the man who helped you in Urslean Forest."
			puts "#{self.name}: Dwarzengorf what are you doing here?"
			pause
			puts "Dwarzengorf: Stop this please."
			puts "Dwarzengorf looks terrified!"
			puts "You can see his freckled face is covered in tears."
			puts "Familiar Voice: Hahahahah ha ha ha ha ha."
			puts "Fire Fairie: Something is blocking my elements... I can't keep the light open much longer!"
			pause
			puts "\e[1;31mThe circle of light that surrounded your party is vanishing!\e[0m"
			puts "Something here is right and wrong at the same time."
			puts "#{self.name}: I feel it right next to us..."
			puts "Kitylmistra: ...."
			puts "You cannot see the presence."
			puts "#{self.name}: Let my friend Dwarzengorf go."
			pause
			puts "Earth Fairie: I feel weak..."
			puts "Fire Fairie: It is coming!"
			pause
			puts "Kitylmistra: ..."
			puts "#{self.name}: Figaro instructed me to Darcanthus.... let us pass."
			puts "#{self.name}: Dwarzengorf run!" 
			puts "Kitylmistra: As you speak your village burns."
			pause
			puts "The apparition is visible now and looks like a thousand year old soldier."
			puts "It's face is twisted and corted, it stands twice your height."
			pause
			puts "Earth Fairie, Fire Fairie: #{self.name} the apparition is draining us of our energy!"
			puts "Kitylmistra: You may not cross."
			pause
			puts "As you look up at the Kitylmistra's height you remember how tall your father seemed to you as a child."
			pause
			puts "#{self.name}: We don't have time for this."
			puts "\e[1;31mYou attack!\e[0m"
			encounter_boss
			end
			def storyline_thirteen
			puts "Dwarzengorf: Not long after you left an evil force condemned Urselan."
			puts "Dwarzengorf: Figaro and the other disciples stood up against Kitylmistra's creator."
			puts "Dwarzengorf: They fought valiantly but..."
			pause
			puts "Dwarzengorf: What came to our village was too powerful..."
			puts "Dwarzengorf: I was following behind you watching over you as Figaro instructed."
			pause
			puts "Dwarzengorf: A young sorcerous confronted an ancient enemy."
			puts "Dwarzengorf: An enemy as ancient as time."
			puts "Dwarzengorf: The enemy drained the sorcerous of all her power."
			pause
			puts "Dwarzengorf: The sorcerous is gone.  She is now simply the Consumer of Souls."
			puts "Dwarzengorf: Aptly named as it now grows stronger with every death."
			puts "Dwarzengorf: They want you #{self.name}."
			pause
			puts "Dwarzengorf: I saw the Kitylmistra speaking to some figure..."
			puts "Dwarzengorf: I think they are close."
			puts "#{self.name}: Come on then, we must move."
			pause
			puts "Dwarzengorf: No I cannot continue..."
			puts "Dwarzengorf: I am wounded."
			puts "Dwarzengorf: I won't be of any use, I'm too weak to fight."
			puts "#{self.name}: I'll handle the fighting."
			puts "Fire Fairie: Join us!"
			puts "#{self.name}: For Urselan."
			puts "Dwarzengorf: Aye."
			pause
			puts "Dwarzengorf: ...."
			puts "Dwarzengorf: No I cannot continue.."
			puts "#{self.name}: Remember the river by Shield's Canyon?"
			pause
			puts "Dwarzengorf: #{self.name}... please..."
			puts "#{self.name}: What did you tell me?"
			puts "Dwarzengorf: 'Where the river flows life follows.'"
			puts "Dwarzengorf: Urselanians are like this river we bring life."
			puts "#{self.name}: We must continue on.."
			puts "\e[1;31mDwarzengorf graps your hand.\e[0m"
			pause
			puts "Dwarzengorf: Aye."
			puts "Dwarzengorf: For Urselan?"
			pause
			puts "#{self.name}: Not anymore..."
			pause
			puts "#{self.name}: I always will love Urselan."
			puts "#{self.name}: When this nightmare is finished we will rebuild our village in the image of our fathers."
			puts "#{self.name}: Now though, we fight for Arcania."
			pause
			puts "\e[1;31mDwarzengorf joins your party.\e[0m"
			puts "Dwarzengorf: I can help guide us to Darcanthus."
			pause
			puts "#{self.name}: Good. Let's go."
			puts "A monster comes closer."
			end
			def storyline_fourteen
			puts "You see an elderly trader."
			puts "Elderly trader: I'll sell you a potion for 300 gold." 
			puts "Elderly trader: Yes or no wanderer?"
			buy_potion?
			puts "A monster comes closer."
			end
			def storyline_fifteen
			puts "Familiar Voice: I will meet you where the roads cross."
			pause
			puts "#{self.name}: Did you hear that?"
			pause
			puts "Fire Fairie: Hear what?"
			pause
			puts "Earth Fairie: I didn't hear anything..."
			pause
			puts "#{self.name}: I must be going crazy..."
			pause
			puts "Familiar Voice: Come to me my child."
			pause
			puts "Dwarzengorf: #{self.name} why are you standing there? Let's go."
			pause
			puts "A monster comes closer."
			end
			def storyline_sixteen
			puts "Familiar Voice: I have been with you since your birth."
			pause
			puts "Dwarzengorf: Come on #{self.name} we have to continue!"
			pause
			puts "#{self.name}: Ahhhhhh!"
			puts "Dwarzengorf: What's wrong!"
			pause
			puts "#{self.name}: My head...."
			pause
			puts "Figaro: Come to us."
			pause
			puts "#{self.name}: #{self.location} is spinning... I feel..."
			pause
			puts "\e[1;31mYou collapse unconscious.\e[0m"
			pause
			puts "."
			puts ".."
			puts "..."
			pause
			puts "...."
			puts "......"
			puts "......."
			pause
			puts "........."
			puts "Father: #{self.name} come downstairs."
			pause
			puts "#{self.name}: Coming!"
			pause
			puts "Father: #{self.name} bring your sister, tell her we are going to the stables."
			pause
			puts "#{self.name}: Okay!"
			pause
			puts "Dwarzengorf: You know the child is gaining strength."
			pause
			puts "Figaro: Yes but it is not the time."
			pause
			puts "Father: He should be trained soon."
			puts "Figaro: You said the same for Azgard."
			pause
			puts "Father: Figaro I told you Azgard is dead."
			pause
			puts "Dwarzengorf: The child needs training."
			puts "Dwarzengorf: The disciple's manuscript has foretold this."
			pause
			puts "Father: Dwarzengorf you are a fool."
			puts "Father: Figaro if you will not train him, I will."
			pause
			puts "Father: You and I both know the sha..."
			puts "#{self.name}: I'm here dad!"
			pause
			puts "#{self.name}: Look at the horses dad..."
			puts "#{self.name}: they look afraid of us."
			pause
			puts "Father: Not afraid child."
			puts "Father: Loyal."
			pause
			puts "#{self.name}: Do they know we sit atop them saddled?"
			puts "Father: You are mistaken child."
			pause
			puts "Father: Yes they understand this – "
			pause
			puts "Father: However we do not sit atop them."
			puts "Father: The horse allows us the privilege."
			pause
			puts "Father: As the water allows us to drink."
			puts "Father: Such as all things are connected."
			pause
			puts "#{self.name}: I don't care if he has weapons, I am going after him!"
			pause
			puts "Azgard: #{self.name} after your father's death you've been nothing but reckless!"
			pause
			puts "#{self.name}: Get out of my way."
			puts "\e[1;31mYou shove your sister out of the way.\e[0m"
			pause
			puts "Sister: I'm not going to let you..."
			puts "#{self.name}: I told you already I'm not a part of this."
			pause
			puts "Sister: Wake up #{self.name}!"
			puts "Sister: We don't have time for this!"
			pause
			puts "Dwarzengorf: Wake up #{self.name}!"
			puts "Dwarzengorf: We don't have time for this!"
			pause
			puts "#{self.name}: Dwarzengorf... I'm awake..."
			puts "#{self.name}: I don't know what happened..."
			pause
			puts "Dwarzengorf: You fell unconscious..."
			pause
			puts "Dwarzengorf: If you can stand let us go!"
			pause 
			puts "A monster comes closer."
			end
			def storyline_seventeen
			puts "Dwarzengorf: I was telling you about the jewel... the jewel is not a gemstone."
			pause
			puts "Earth Fairie: You speak of the prophecy!"
			puts "Fire Fairie: Could it be true?"
			pause
			puts "Familiar Voice: #{self.name} Listen to me... "
			pause
			puts "\e[1;31mYou cannot understand Dwarzengorf.\e[0m"
			puts "Dwarzengorf: ............."
			pause
			puts "Dwarzengorf: ................. "
			pause
			puts "Familiar Voice: #{self.name} Listen to me....... "
			pause
			puts "Dwarzengorf: ............"
			puts "Dwarzengorf: ......"
			pause 
			puts "Familiar Voice: Listen to me and only me..... "
			puts "#{self.name}: Yes.... "
			pause
			puts "Dwarzengorf: ......... "
			puts "Dwarzengorf: .............."
			pause
			puts "Familiar Voice: You will belong to me soon..."
			puts "Dwarzengorf: ....... "
			pause
			puts "#{self.name}: Yes......"
			puts "Dwarzengorf: .........."
			pause
			puts "Dwarzengorf: ...... "
			pause
			puts "Earth Fairie: #{self.name} watch out!!!!"
			pause
			encounter_boss
			end
			def storyline_eighteen
			puts "Psychic Fairie: You freed me!"
			pause
			puts "#{self.name}: Who are you?"
			pause
			puts "Psychic Fairie: I will help you."
			puts "Psychic Fairie: There are two others left to be freed like me."
			pause
			puts "Psychic Fairie: We can each teach you powerful spells."
			pause
			puts "Psychic Fairie joins your party."
			puts "\e[1;31mYou learn the spell Blue!\e[0m"
			Spells[4].active_flag = 1
			pause
			puts "1"
			puts "Last conversation with Figaro. The town is ruined from Urselan all the way to where you are. A trail of fire that is following you. A demon spirit."
			end
			def storyline_ninteen
			puts "Hear from Azgard the elder."
			end
			def storyline_twenty
			puts "Get a partner to join your quest."
			end
			def storyline_twenty_one
			puts "The demon spirit draws closer. "
			encounter_boss
			end
			def storyline_twenty_two
 			puts "The demon spirit draws nearer."
			end
			def storyline_twenty_three
			puts "Confront the demon spirit."
			end
			def storyline_twenty_four
			puts "The demon spirit watches you."
			puts "Famliar voice?"
			end
			def storyline_twenty_five
			puts "Fight the demon spirit."
			end
			def storyline_twenty_six
			puts "Hear from Figaro, freed from the demon spirit."
			puts "Hear from Dwarzengorf, freed from the demon spirit."
			puts "They join the essence of Arcania."
			end
			def storyline_twenty_seven
			puts "Flashback."
			end
			def storyline_twenty_eight
			end
			def storyline_twenty_nine
			end
			def storyline_thirty
			end
			def storyline_thirty_one
			end
	end