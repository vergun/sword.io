# character class defines the character, battle logic, and interfaces with data/data, status/status, and storyline/storyline to develop the game's plot


class Character < Attributes
	include Status
	attr_accessor :name, :strength, :vitality, :magic, :calculated_damage, :current_vitality, :current_magic, :role, :role_flag, :role_message, :current_level, :experience, :gold, :current_adjective, :current_experience, :next_level_experience, :current_monster, :monsters_killed, :monsters_killed_location_flag, :current_gold, :level_up_flag, :belt, :gender, :potions, :points, :current_choice, :current_answer, :current_spell, :spell_flag

		def initialize(name, calculated_damage, current_vitality, current_magic, role, role_flag, role_message, current_level, experience, gold, current_adjective, current_experience, next_level_experience, current_monster, monsters_killed, monsters_killed_location_flag, current_gold, level_up_flag, belt, gender, potions, points, current_choice, current_answer, current_spell, spell_flag)
			@name = name
			@current_magic = current_magic
			@calculated_damage = calculated_damage
			@current_vitality = current_vitality
			@role = role
			@role_flag = role_flag
			@role_message = role_message
			@current_level = current_level
			@experience = experience
			@gold = gold
			@current_adjective = current_adjective
			@current_experience = current_experience
			@next_level_experience = next_level_experience
			@current_monster = current_monster
			@monsters_killed = monsters_killed
			@monsters_killed_location_flag = monsters_killed_location_flag
			@current_gold = current_gold
			@level_up_flag = level_up_flag
			@belt = belt
			@gender = gender
			@potions = potions
			@points = points
			@current_choice = current_choice
			@current_answer = current_answer
			@current_spell = current_spell
			@spell_flag = spell_flag
		end

		
		def location_message	
			self.monsters_killed = case self.monsters_killed_location_flag
			when  6, 12, 21, 31, 41, 54, 67, 81, 82, 98, 120, 136, 151, 167, 168, 183, 198, 211, 227, 243, 267
				puts "\e[1;31mYou've reached a new area, #{self.location}!\e[0m"
			else
				self.monsters_killed
			end
		end

		def role_new_message
			self.role_message = case self.current_level
			when 2, 4, 7, 10, 15, 18, 22, 26, 30, 34, 38, 43, 48, 52, 55, 60
				puts "\e[1;31mYou earned a new title, #{self.role}!\e[0m"
			else
				self.role_message
			end
		end

		def battle_welcome_message
			saying = random(Sayings.length)
			puts Sayings[saying]
		end

		def get_adjective
			adjective = random(Adjectives.length)
			return Adjectives[adjective]
		end

		def chance_of_miss
			unless self.spell_flag == 1
				misschance = random(0..20)
				return misschance
			else 
				misschance == 1
			end
		end

		def calculate_damage
			misschance = chance_of_miss
			if misschance == 0
				self.calculated_damage = 0
			elsif self.spell_flag == 1
				self.calculated_damage = random((self.current_spell.spell_damage)/5..self.current_spell.spell_damage)
			else
				self.calculated_damage = random((self.strength)/5..self.strength)
			end
		end

		def calculate_monster_damage
			self.current_monster.calculated_damage = random(self.current_monster.strength)
		end

		def calculate_monster_experience
			self.current_monster.experience = random(self.current_monster.experience/2..self.current_monster.experience)
			self.current_experience += self.current_monster.experience
		end

		def calculate_monster_gold
			self.current_monster.gold = random(self.current_monster.gold/2..self.current_monster.gold)
			self.current_gold += self.current_monster.gold
		end

		def encounter_monster
			stats
			monsters_at_this_location = []
			Monsters.each do |monster|
				if monster.location == self.location
					monsters_at_this_location << monster
				else
					monsters_at_this_location
				end
			end
			self.current_monster = monsters_at_this_location[random(monsters_at_this_location.length)]
			self.current_monster.current_vitality = self.current_monster.vitality
			puts "You encounter a " + self.current_monster.name + "." 
			battle_welcome_message
			choice_next?
		end

		def encounter_boss
			stats
			self.current_monster = Bosses.shift
			self.current_monster.current_vitality = self.current_monster.vitality
			puts "You face the " + self.current_monster.name + "!"
			battle_welcome_message
			choice_next?
		end

		def battle
			stats
			calculate_damage
			if self.current_monster.current_vitality <= 0
				you_win
			else self.calculated_damage == 0 ? misfire : deal_damage
				self.current_monster.current_vitality > 0 ? (puts "#{self.current_monster.name} has #{self.current_monster.current_vitality} vitality remaining!") : you_win
				pause
				monster_attacks
				choice_next?
			end
		end

		def battle_spell
			stats
			calculate_damage
			if self.current_monster.current_vitality <= 0
				you_win
			else self.calculated_damage == 0 ? misfire : deal_damage
				self.current_monster.current_vitality > 0 ? (puts "#{self.current_monster.name} has #{self.current_monster.current_vitality} vitality remaining!") : you_win
				pause
				monster_attacks
				choice_next?
			end
		end

		def choice_next?
			print "(Action): "
			answer = gets.chomp
			current_choice == case answer
			when "1"
				battle
			when "2"
				magic_list
			when "3"
				use_potion
			when "4"
				enough_attribute_points?
			when "5"
				show_map
			when "6"
				save_game
			when "7"
				run
			else
				choice_next?
			end
			current_choice
		end

		def list_spells
			puts "0.  Go back"
			Spells.each_with_index do |spell, i|
				if spell.active_flag != 0
					puts (i+1).to_s + ".  #{spell.spell_name}"
					puts "     #{spell.spell_description} #{spell.spell_cost} Magic."
				else 
					spell.active_flag
				end
			end
			spell_choice?
		end

		def spell_choice?
			print "(Spell): "
			answer = gets.chomp
			if answer == "0"
				go_back
			else
				self.current_spell = Spells[answer.to_i - 1]
				self.current_spell.nil? ? not_a_spell_choice : self.current_spell
				if self.current_magic < self.current_spell.spell_cost
					puts "Not enough magic."
					spell_choice?
				else
				self.current_magic -= self.current_spell.spell_cost
				current_choice = case answer
					when "1"
						inspect_spell
					when "2"
						heal_spell
					when "3"
						fireball_spell
					when "4"
						root_spell
					when "5"
						psychokinesis_spell
					when "6"
						atmospheric_spell
					else
						current_choice
					end
				current_choice
				end
			end
		end

		def not_a_spell_choice
			puts "Not a spell choice."
			spell_choice?
		end

		def magic_list
			stats
			list_spells
			pause
			monster_attacks
			choice_next?
		end

		def inspect_spell
			stats
			puts "Inspecting..."
			pause
			stats
			puts "#{current_monster.name}, #{current_monster.role} Level #{current_monster.current_level}."
			pause
			stats
			puts "Inspecting..."
			pause
			stats
			puts "#{current_monster.strength} Strength, #{current_monster.current_vitality}/#{current_monster.vitality} Vitality. "
			if current_monster.weakness != ""
				print "Weak to #{current_monster.weakness}."
			else 
				print "No weaknesses."
			end
		end

		def heal_spell
			vitality_difference = self.current_vitality
			self.current_vitality += 100
			self.current_vitality > self.vitality ? self.current_vitality = self.vitality : self.current_vitality
			vitality_difference -= self.current_vitality
			stats
			puts "You gain #{vitality_difference.abs} vitality!"
		end

		def fireball_spell
			if self.current_spell.active_flag != 0
				self.spell_flag = 1
				puts "You unleash a mighty fireball!"
				battle_spell
			else
				not_a_spell_choice
			end
		end

		def root_spell
			if self.current_spell.active_flag != 0
				self.spell_flag = 1
				puts "Your roots dig deep into the ground!"
				Spells[3].roots_flag = 1
				battle_spell
			else
				not_a_spell_choice
			end
		end

		def psychokinesis_spell
			if self.current_spell.active_flag != 0
				self.spell_flag = 1
				puts "You conjure a powerful psychokinetic blast!"
			else
				not_a_spell_choice
			end
		end

		def atmospheric_spell
			if self.current_spell.active_flag != 0
				self.spell_flag = 1
				puts "The atmosphere moves and heaven and earth shake!"
			else
				not_a_spell_choice
			end
		end

		def buy_potion?
			answer = gets
			if self.gold >= 300
				if (answer.strip.upcase == "Y" || answer.strip.upcase == "YES")
					self.potions+=1
					self.gold-=300
					puts "\e[1;31mYou received a potion!\e[0m"
				elsif (answer.strip.upcase == "N" || answer.strip.upcase == "NO")
					self.potions
					self.gold
				else
					puts "Elderly trader: Buy potion?"
					buy_potion?
				end
			else
				puts "Not enough gold."
			end
		end

		def drop_potion?
			mybe = random(0..32)
			if mybe == 7
				self.potions += 1
				puts "\e[1;31m#{self.current_monster.name} dropped a potion!\e[0m"
			else mybe
			end
		end

		def use_potion
			if self.potions == 0
				puts "You are out of potions!"
				choice_next?
			else
				self.potions -= 1
				vitality_difference = self.current_vitality
				magic_difference = self.current_magic
				self.current_vitality += 100
				self.current_magic += 100
				self.current_vitality > self.vitality ? self.current_vitality = self.vitality : self.current_vitality
				self.current_magic > self.magic ? self.current_magic = self.magic : self.current_magic
				vitality_difference = (vitality_difference -= self.current_vitality).abs
				magic_difference = (magic_difference -= self.current_magic).abs
				stats
				if vitality_difference > 0 && magic_difference == 0
					puts "You use a potion and gain #{vitality_difference} vitality!"
				elsif vitality_difference == 0 && magic_difference > 0
					puts "You use a potion and gain #{magic_difference} magic!"
				elsif vitality_difference >= 0 && magic_difference >= 0
					puts "You use a potion and gain #{vitality_difference} vitality and #{magic_difference} magic!"
				else
					vitality_difference && magic_difference
				end
				choice_next?
			end
		end

		def list_attributes
			puts "Each point is worth 5 in the chosen attribute."
			puts "0. Go back."
			puts "1. Strength: #{self.strength}"
			puts "2. Vitality: #{self.vitality}"
			puts "3. Magic: #{self.magic}"
		end

		def enough_attribute_points?
			stats
			unless self.points < 1 
				list_attributes
				attribute_points_choice?
			else
				puts "Strength: #{self.strength}"
				puts "Vitality: #{self.vitality}"
				puts "Magic: #{self.magic}"
				puts "Earn more attribute points by leveling up."
				choice_next?
			end
		end

		def attribute_points_choice?
			print "(Attribute): "
			answer = gets.chomp
			self.points = case answer
				when "0"
					self.points
				when "1"
					self.points - 1
				when "2"
					self.points - 1
				when "3"
					self.points - 1
				else
					self.points 
				end
			current_choice = case answer
				when "0"
					go_back
				when "1"
					self.attribute_strength
				when "2"
					self.attribute_vitality
				when "3"
					self.attribute_magic
				else
					attribute_points_choice?
				end
			current_choice
		end

		def go_back
			stats
			choice_next?
		end

		def attribute_point_increase
			stats
			puts "You feel more powerful."
			pause
			enough_attribute_points?
		end

		def show_map
			puts "You are looking at the map."
			pause
			battle
		end

		def get_level_up_points
			self.points += 5
		end

		def you_win
			calculate_monster_experience and calculate_monster_gold
			drop_potion?
			self.monsters_killed += 1
			self.monsters_killed_location_flag = self.monsters_killed
			location_check 
			Spells[3].roots_flag == 1 ? Spells[3].roots_flag = 0 : Spells[3].roots_flag
			(self.current_experience >= Levels[self.current_level+1]) ? (self.current_level += 1 and self.level_up_flag = 1) : self.current_experience
			if self.level_up_flag == 1
				self.gender == "his" ? role_check_warrior : role_check_sorcerous
				get_level_up_points	
			else
				self.level_up_flag
			end
			stats
			if self.level_up_flag == 1
				puts "\e[1;31mYou reached level #{self.current_level}!\e[0m"
				role_new_message
				puts "\e[1;31mYou gained 5 attribute points!\e[0m"
				self.current_vitality = self.vitality
				self.current_magic = self.magic
				puts "Your vitality and magic are restored!"
			else
				self.level_up_flag
			end
			puts "You won the battle!"
			puts "You gained #{self.current_monster.experience} experience and #{self.current_monster.gold} gold."
			location_message
			self.level_up_flag = 0
			self.monsters_killed = self.monsters_killed_location_flag
			gets
			clear_screen
			storyline_message
			gets
			encounter_monster
		end

		def assign_role
			pause
			clear_screen
			super
		end


		def monster_attacks
			if Spells[3].roots_flag == 1 && Spells[3].active_flag == 1
				rndm = rand(1..5)
				if rndm.between?(1,3)
					stats
					puts "#{self.current_monster.name} broke free from Roots!"
					Spells[3].roots_flag = 0
				elsif rndm.between?(4,5)
					stats
					puts "#{self.current_monster.name} is immobilized by Roots!"
					puts "#{self.current_monster.name} takes #{Spells[3].spell_attribute} damage from roots!"
					self.current_monster.current_vitality -= self.calculated_damage
					self.current_monster.current_vitality > 0 ? (puts "#{self.current_monster.name} has #{self.current_monster.current_vitality} vitality remaining!") : you_win
				else rndm
				end
			else
				calculate_monster_damage
				self.current_vitality -= self.current_monster.calculated_damage
				self.current_vitality < 0 ? self.current_vitality = 0 : self.current_vitality
				stats
				self.current_monster.calculated_damage == 0 ? (puts "#{self.current_monster.name} missed!") : (puts "#{self.current_monster.name} #{get_adjective} and deals #{self.current_monster.calculated_damage} damage!")
				if self.current_vitality == 0
					puts "You died. Darkness falls on Arcania until a new hero arrives..."
					pause
					start
				else self.current_vitality
				end
			end
		end

		def run
			if current_monster.boss_flag == 1
				stuck_in_battle
			else
			can_run = random(31)
			can_run > 22 ? leave_battle : stuck_in_battle
			end
		end

		def misfire
			puts "You missed! 0 damage dealt!"
		end

		def deal_damage
			if self.spell_flag == 1
				puts self.current_spell.spell_message + " #{self.calculated_damage} damage!"
			elsif self.spell_flag = 0
				if self.calculated_damage == self.strength
					puts "\e[1;31mCritical strike! You inflicted #{self.calculated_damage.to_s} damage!\e[0m"
				else 
					puts "You dealt #{self.calculated_damage.to_s} damage!"
				end
			end
			self.current_monster.current_vitality -= self.calculated_damage
			self.spell_flag = 0
		end

		def leave_battle
			stats
			puts "You safely run away from battle."
			pause
			encounter_monster
		end

		def stuck_in_battle
			stats
			if current_monster.boss_flag == 0
				puts "Unable to leave! The #{self.current_monster.name} bellows..."
			elsif current_monster.boss_flag == 1
				puts "An ethereal force keeps you in combat. #{self.current_monster.name} looks at you!"
			else
				current_monster.boss_flag
			end
			pause
			monster_attacks
			choice_next?
		end

		def language(item)
			item != 1 ? "" : "s"
		end

		def stats
			clear_screen
			a = "#{self.name} | Level #{self.current_level} #{self.role} | #{self.location} |  #{self.current_vitality}/#{self.vitality} Vitality |  #{self.current_magic}/#{self.magic} Magic | #{self.current_gold} Gold | #{self.current_experience}/#{Levels[self.current_level+1]} until Level Up |".length
			b = "| 1. Attack | 2. Spells | 3. #{self.potions} Potion#{language(self.potions)} | 4. Inventory | 5. Map | 6. Save Game |"
			puts "                                   |#{self.name} | Level #{self.current_level} #{self.role} | #{self.location} |  #{self.current_vitality}/#{self.vitality} Vitality |  #{self.current_magic}/#{self.magic} Magic | #{self.current_gold} Gold | #{self.current_experience}/#{Levels[self.current_level+1]} until Level Up |"
		    puts "                                   " + "_"*a + " "
		    puts "                                   | 1. Attack | 2. Spells | 3. Potion#{language(self.potions)} (#{self.potions}) | 4. Attribute Points#{language(self.points)} (#{self.points}) | 5. Map | 6. Save Game | 7. Run"
		    puts "                                   " + "_"*a + " "
		end
end
