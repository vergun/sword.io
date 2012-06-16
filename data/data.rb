#Sayings is a collection of greeting messages that are called at random (1 per battle) when a character/monster battle begins
Sayings = ["It peers into your soul.", "You brace yourself for carnage.", "Spit drips from its front canines.", "The claws on its foot tap patiently in the muddy dirt.", "Spit flies nearby from its lashing purple tongue.",
"Your clutch on your weapon stiffens as it draws nearer.", "The surroundings are so still that you hear every breath.", "Your foot pushes deeply into the dirt to brace for what is about to come.", "Its visible eye suggests that it is hungry.",
"You look to the sky and see only darkness.", "Your adrenaline is palpable within your veins.", "You meet this monster without reservation.", "You embrace your years of combat training as you strategize the first strike."]

#Adjectives is a collection of descriptions that are called at random (1 per attack) when a monster attacks a character
Adjectives = ["lashes", "attacks", "bites", "claws", "stampedes", "digs in"]

#Monster is a collection of enemies that the player most frequently encounters in the game
Monster = Struct.new(:name, :strength, :vitality, :magic, :calculated_damage, :current_vitality, :location, :role, :weakness, :current_level, :experience, :gold, :boss_flag)

#Boss is a collection of the most powerful enemies that the player encounters in the game
Boss = Struct.new(:name, :strength, :vitality, :magic, :calculated_damage, :current_vitality, :location, :role, :weakness, :current_level, :experience, :gold, :boss_flag)

#Spell is a collection of spells the player learns by rescuing fairies throughout the game
Spell = Struct.new(:spell_name, :spell_damage, :spell_healing, :spell_cost, :spell_attribute, :spell_description, :active_flag, :spell_message, :roots_flag)

#Spells is the container that holds each spell
Spells = [
Spell.new("Inspect", 0, 0, 0, 0, "Reveals an enemy's remaining vitality and weakness.", 1, "", 0),
Spell.new("Heal", 0, 100, 10, 0, "Restores up to 100 of your vitality.", 1, "", 0),
Spell.new("Fireball", 20, 0, 1, 0, "A fireball deals up to 20 damage to your enemy.", 0, "You conjure a Fireball that deals", 0),
Spell.new("Roots", 20, 0, 5, 5, "Summons roots that deal damage and immobilize your enemy every turn.", 0, "Roots immobilize your enemy.", 1),
Spell.new("Blue", 100, 0, 5, 0, "Harneses a powerful singular blast of mental energy that deals subsequent damage every turn.", 0, "Psionic energy deals", 0),
Spell.new("Titania's Legionnaires", 200, 0, 20, 0, "Multiple attacks deal massive damage.", 0, "A summoned disciple deals", 0)
]

#Monsters is the container that holds each monster
Monsters = [
	Monster.new("Gorgon", 6, 22, 1, 0, 0, "Urselan Forest", "Rock Creature", "Fire", 3, 15, 10, 0),
	Monster.new("Alkazar", 15, 15, 4, 0, 0, "Urselan Forest", "Woodland Creature", "", 4, 18, 5, 0),
	Monster.new("Mydoor", 10, 14, 0, 0, 0, "Urselan Forest", "Fire Creature", "Water", 5, 20, 11, 0),
	Monster.new("Saruset", 11, 32, 0, 0, 0, "Urselan Forest", "Reptile Creature", "", 6, 22, 16, 0),
	Monster.new("Mayatzar", 15, 26, 5, 0, 0, "Urselan Bogs", "", "", 7, 24, 18, 0),
	Monster.new("Decrakon", 14, 40, 2, 0, 0, "Urselan Bogs", "", "", 8, 26, 20, 0),
	Monster.new("Pangeria", 20, 150, 100, 0, 0, "Urselan Bogs", "", "", 9, 28, 22, 0),
	Monster.new("Clemestria", 24, 51, 11, 0, 0, "Urselan Bogs", "", "", 10, 30, 24, 0),
	Monster.new("Slime Ball", 3, 10, 200, 0, 0, "Urselan Bogs", "", "", 11, 32, 26, 0),
	Monster.new("Mindless", 3, 10, 200, 0, 0, "Urselan Outskirts", "", "", 12, 34, 28, 0),
	Monster.new("Apparition", 3, 10, 200, 0, 0, "Urselan Outskirts", "", "", 13, 36, 30, 0),
	Monster.new("Illusionary Wall", 3, 10, 200, 0, 0, "Urselan Outskirts", "", "", 14, 38, 32, 0),
	Monster.new("Phantasm", 3, 10, 200, 0, 0, "Urselan Outskirts", "", "", 15, 40, 34, 0),
	Monster.new("Proto Decrakon", 60, 60, 60, 0, 0, "Darcanthus", "", "", 16, 42, 36, 0),
	Monster.new("Grogoni", 44, 130, 26, 0, 0, "Darcanthus", "", "", 17, 44, 38, 0),
	Monster.new("True Saruset", 38, 165, 10, 0, 0, "Darcanthus", "", "", 18, 46, 40, 0),
	Monster.new("Two-headed Alkazar", 76, 226, 0, 0, 0, "Darcanthus", "", "", 19, 48, 42, 0),
	Monster.new("Two-headed Alkazar", 76, 226, 0, 0, 0, "Darcanthus", "", "", 20, 50, 44, 0),
	Monster.new("Two-headed Alkazar", 76, 226, 0, 0, 0, "Darcanthus", "", "", 21, 52, 46, 0),
	Monster.new("Two-headed Alkazar", 76, 226, 0, 0, 0, "Darcanthus", "", "", 22, 54, 48, 0),
	Monster.new("Two-headed Alkazar", 76, 226, 0, 0, 0, "Darcanthus", "", "", 23, 56, 50, 0),
	Monster.new("Two-headed Alkazar", 76, 226, 0, 0, 0, "Darcanthus", "", "", 24, 58, 52, 0)
]

#Bosses is the container that holds each boss
Bosses = [
	Boss.new("Rankadon", 30, 200, 0, 0, 0, 6, "Rock Creature", "", 18, 150, 300, 1),
	Boss.new("Kitylmistra", 60, 300, 0, 0, 0, 12, "Ethereal Apparition", "", 26, 280, 600, 1),
	Boss.new("Wasted Souls", 130, 600, 0, 0, 0, 31, "Condemned Spirits", "", 50, 690, 912, 1),
	Boss.new("Consumer of Souls", 100, 500, 0, 0, 0, 26, "Haunting", "", 41, 500, 896, 1)
] 

#Levels is a collection of associations between the players level (key or left-side) and the experience points required to reach the next level (value or right-side)
Levels = {2 => 50, 3 => 110, 4 => 200, 5 => 320, 
	6 => 480, 7 => 660, 8 => 1210, 9 => 1706, 10 => 2204, 
	11 => 2205, 12 => 2206, 13 => 2207, 14 => 2208, 15 => 2209, 
	16 => 2210, 17 => 2211, 18 => 2212, 19 => 2213, 20 => 2214, 
	21 => 2215, 22 => 2216, 23 => 2217, 24 => 2218, 25 => 2219, 
	26 => 2220, 27 => 2221, 28 => 2222, 29 => 2223, 30 => 2224,
	31 => 2225, 32 => 2226, 33 => 2227, 34 => 2228, 35 => 2229,
	36 => 2230, 37 => 2231, 38 => 2232, 39 => 2233, 40 => 2234,
	41 => 2235, 42 => 2236, 43 => 2237, 44 => 2238, 45 => 2239,
	46 => 2240, 47 => 2241, 48 => 2242, 49 => 2243, 50 => 2244,
	51 => 2245, 52 => 2246, 53 => 2247, 54 => 2248, 55 => 2249,
	56 => 2250, 57 => 2251, 58 => 2252, 59 => 2253, 60 => 2254}