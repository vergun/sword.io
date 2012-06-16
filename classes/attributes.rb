# attributes.rb defines the attributes for bosses and monsters and the game's opening sequence

class Attributes 
	include Storyline
	attr_accessor :name, :strength, :vitality, :magic, :calculated_damage, :current_vitality, :location, :role, :weakness, :current_level, :experience, :gold, :boss_flag

	def initialize(name, strength, vitality, magic, calculated_damage, current_vitality, location, role, weakness, current_level, experience, gold, boss_flag)
		@name = name
		@strength = strength
		@vitality = vitality
		@magic = magic
		@calculated_damage = calculated_damage
		@current_vitality = current_vitality
		@location = location
		@role = role
		@weakness = weakness
		@current_level = current_level
		@experience = experience
		@gold = gold
		@boss_flag = boss_flag
	end

	def clear_screen
		puts "\e[H\e[2J"
	end

	def random(number)
		return rand(number)
	end

	def pause
		gets
		clear_screen
	end

	def get_name
		self.name.to_s
	end

	def get_location
		self.location.to_s
	end

	def assign_name
		clear_screen
		print "What would you like your character's name to be? "
		self.name = gets.chomp.to_s
		if self.name == "" || self.name == " "
			clear_screen
			assign_name
		else
			self.name
		end
		clear_screen
		print get_name + " stands at the town of Urselan's gates and peers into the dimly lit forest. The air is dry and musk."
		self.location = "Urselan"
		gets
		town
	end

	def town
		clear_screen
		print "Would you like to stay in #{get_location} or leave? "
		decision = gets.chomp
		if (decision.capitalize == "S") || (decision.capitalize == "Stay")
			urselan
		elsif (decision.capitalize == "L") || (decision.capitalize == "Leave")
			self.location = "Urselan Forest"
			stats
			puts "You enter a new area, Urselan Forest. A monster comes closer."
			pause
		else 
			clear_screen
			town
		end
	end

	def attribute_strength
		self.strength = self.strength + 5
		attribute_point_increase
	end

	def attribute_vitality
		self.vitality += 5
		self.current_vitality += 5
		attribute_point_increase
	end

	def attribute_magic
		self.magic += 5
		self.current_magic += 5
		attribute_point_increase
	end

	def assign_role
		print "\e[0;1m Would you like to be a Warrior or Sorcerous?\e[0m "
		answer = gets.chomp
		self.vitality = 150
		self.current_vitality = self.vitality
		self.current_level = 1
		self.current_gold = 0
		self.experience = 0
		self.location = "Urselan"
		self.potions = 1
		self.points = 0
		if (answer.capitalize == "Warrior") || (answer.capitalize == "W")
			self.strength = 20
			self.magic = 10
			self.current_magic = self.magic
			self.role = "Warrior"
			self.role_flag = "Warrior"
			self.gender = "his"
			puts "You selected Warrior. Your thirst for carnage is known throughout the lands of Arcania and is only matched by the powers with which you wield your sword."
			puts %q!

                 .-'`-.
                / | |  \
               /  | |   \
              |___|_|__  |
              ||<o>| <o>`|
              ||   J_   )|
              `|`-'__`-'|/
               |  `--'  |
             .-|        |_
          .-'  \     /  | |`-.
       .-'      `.     /| |   \
      /           ````' | |    \
     |_____             | |     L
  .-' ___   `-.         F F  |  |
.'.-'  |  `-.  `.      J J   /  |
/ /|    |    |`.  \     | |   |/ |
/ / |    |    |  `. `.   F F   |  |
J /  |    |    |    \  L J J    |  |
FJ   |    |    |    |L J/ /     |   \
J |() | () | () | () | J L/      |   |
| F   | .-'_ \  |    |  LJ       | /  L
| L   | /    \\ |    |  | L      |    |
| L   ||     ):||    |  | |     /|     L
J |   ||:._.'::||    |  | |----' |     |
J |   |J:::::::||    |  | |    _/\     |
LJ   | \:::::/ |    |  | |---'\  |    |
J L  |  `-:-'  |    |  | F  | \  |    J
LJ()| () | () | () |  F F  |  \  \--._L
J \ |    |    |    | J J     \    |  |
\ \|    |    |    | / /    |     |  |
\ \    |    |    |/ /|     |    | .-'|
 `.`.  |    |   .'.' |     |    |/ /`L
   `.`-.____|.-'.-'  |     |    | <`. \
     `-.______.-'    |    \|    |_`::\ `.
      |  |           |     |    /   \::. \
      |--|           |     _.--|     `::\ `.
      |\\|-.____     |__.-'    |       \::. \
      | >||      `--' J        |        `::\ `.
      |//JJ        |   L       |          \::. \
      |< |J        |   |       (           `::\ `.
      |\\|J        |   /        )            \::. \
      |--|J        |   \       /              `::\ `.
      |  |L `      )   )` `' '|                 \::. \
      |  L \    '  /   / ' |  |                  `::\ |
      F  F J``  -'|    | | |  |                    \:_|
      `-'  | ""   |    J `    |
           |      |     L     |
           |      |     \     |
           J      |      `.   |
            L     F       )`---\
            |    J        /     `.
            J    J       (        `-.
            `-.__/       `---.       `.
            |   J             `.       )
            /   |               `-----'
           /    F
          J    J
          J    |
!
			pause
		elsif (answer.capitalize == "Sorcerous") || (answer.capitalize == "S")
			self.strength = 10
			self.magic = 20
			self.current_magic = self.magic
			self.role = "Sorcerous"
			self.role_flag = "Sorcerous"
			self.gender = "her"
			puts "You selected Sorcerous. The magical arts and powers of Arcania are strong with you."
			puts %q!
			                       ,
                        `.-- .,-""  .
                    ._,' .  _,.      `.
                     , /  .'.__`..  `. `- .__.-'
                    ::  .; `-()-'`.   \  .    /         ;`  `'
                    ;  /'".      ,"`'.     "  ._,    :' ..'''..':
                  .':  '   `-  -'   :::  '     `.,     :       :
                    ' .:  O      O  ::::  `-   '    ; :         ::
                     `.:     '      ::::. .   .`.    `'.       .'
                       `     "`     '::::.`  (       ;.':.   ..'
                        \   ,--    /     `'.  \         \ '''.'.:
                         .  .__,  ,`         `'.-       |'-.'
                          `. "" .'                     .:  |:::.
                           :`""':                      ;'"';::::'
                          .`-...'.                     |      .'
                         ;   W    `                    :     /
                    _.-'  \       / `-._               ;    .
___________.........--'        `.   ,'       `--..___....-'     ,
                             `.'                            :
                             .                           .-'
 _.-.....__                                      __..."'
.-'            "`-.._ :        :         : _..-'"
.'                     ::.                .;;
                   '::.             .lf::
!
			pause
		else
			clear_screen
			assign_role
		end 
	end
end