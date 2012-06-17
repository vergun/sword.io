	# status.rb defines the game's response to killing monsters as it pertains to location, title, storyline
	
		module Status
			def location_check		#location_check determines the name of the location by the number of monsters killed
				self.location = case self.monsters_killed
				when (1...6)
					"Urselan Forest"
				when (6...12)
					"Urselan Bogs"
				when (12...20)
					"Urselan Outskirts"
				when (20...30)
					"Darcanthus"
				when (30...40)
					"Darcanthus Proper"
				when (40...53)
					"Amortia"
				when (53...66)
					"Amortia Ruins"
				when (66...80)
					"Titania Path"
				when 80
					"Yelill Town"
				when (81...97)
					"Abandoned Yelill Outposts"
				when (97...120)
					"The Great Trail"
				when (120...135)
					"The Caverns"
				when (135...150)
					"Red Rock Opening"
				when (150...166)
					"Egal Ice Travene"
				when (166...182)
					"Ethereal Cross"
				when (182...197)
					"Dawner Shade Blightsmite"
				when (197...210)
					"Belly of the Beast"
				when (210...226)
					"Arcania's Defeat"
				when (226...243)
					"Arcania's Light"
				when (243...266)
					"Yaragon's Lair"
				when 266
					"The Final Battle"
				else
					self.location
				end
			end
			def map_check			#determines which map to display (1 or 2) based on location_check method
				which_map = case self.monsters_killed
				when  (0...80)
					map_one
				when (80..266)
					map_two
				else
					which_map
				end
				which_map
			end
			def role_check_warrior	#role_check_warrior determines the title of the character class (warrior) by the number of monsters killed
				self.role = case self.current_level
				when 2
					"Practiced Warrior"
				when 4
					"Hardened Warrior"
				when 7
					"Warrior Elite"
				when 10
					"Gladiator"
				when 15
					"Accomplished Gladiator"
				when 18
					"Arcania Gladiator"
				when 22
					"Legionnaire"
				when 26
					"Primed Legionnaire"
				when 30
					"Master Legionnaire"
				when 34
					"Warlord"
				when 38
					"Warlord Supreme"
				when 43
					"Warlord Leader"
				when 48
					"Imperial Warlord"
				when 52
					"King"
				when 55
					"Fury King"
				when 60
					"King of Arcania"
				else
					self.role
				end
			end
			def role_check_sorcerous	#role_check_sorcerous determines the title of the character class (sorcerous) by the number of monsters killed
				self.role = case self.current_level
				when 2
					"Magical Sorcerous"
				when 4
					"Enlightened Sorcerous"
				when 7
					"Enchanted Sorcerous"
				when 10
					"Conjourer"
				when 15
					"Mystical Conjourer"
				when 18
					"Genius Conjourer"
				when 22
					"Nasperia"
				when 26
					"Tope Nasperia"
				when 30
					"Maroon Nasperia"
				when 34
					"Pearl Nasperia"
				when 38
					"Noni"
				when 43
					"Puzzling Noni"
				when 48
					"Arcania's Disciple"
				when 52
					"Arcania's Wisdom"
				when 55
					"Arcania's Power"
				when 60
					"Arcania's Queen"
				else
					self.role
				end
			end
			def storyline_message		#storyline_message links the number of monsters killed to the storyline in storyline/storyline 
				self.role_message = case self.monsters_killed
				when 1
					storyline_one
				when 2
					storyline_two
				when 3
					storyline_three
				when 4
					storyline_four
				when 5
					storyline_five
				when 6
					storyline_six
				when 7
					storyline_seven
				when 8
					storyline_eight
				when 9
					storyline_nine
				when 10
					storyline_ten
				when 11
					storyline_eleven
				when 12
					storyline_twelve
				when 13
					storyline_thirteen
				when 14
					storyline_fourteen
				when 15
					storyline_fifteen
				when 16
					storyline_sixteen
				when 17
					storyline_seventeen
				when 18
					storyline_eighteen
				when 19
					storyline_ninteen
				when 20
					storyline_twenty
				when 21
					storyline_twenty_one
				when 22
					storyline_twenty_two
				when 23
					storyline_twenty_three
				when 24
					storyline_twenty_four
				when 25
					storyline_twenty_five
				when 26
					storyline_twenty_six
				when 27
					storyline_twenty_seven
				when 28
					storyline_twenty_eight
				when 29
					storyline_twenty_nine
				when 30
					storyline_thirty
				when 31
					storyline_thirty_one
                else 
                	puts "You continue out of love for Arcania."
                end
            end
	end
