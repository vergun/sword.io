# encoding: utf-8
# This file is root. It links to all other files in the game. This is a list of those files:
require_relative 'status/status'		# counters that determine level, place, abilities
require_relative 'data/data'			# constants that determine places, enemies, abilities
require_relative 'storyline/storyline'	# ongoing storyline relative to monsters killed
require_relative 'classes/attributes'	# enemy, boss, character logic
require_relative 'classes/character'	# battle, spell, character logic

# This method defines the high level game actions sequentially. @@c represents the player and calling the start function begins the game.
def start
@@c = Character.new("", 0, 0, 0, "", "", "", 0, 0, 0, "", 0, 0, "", 0, 0, 0, 0, 0, {}, "", "", "", "", "", 0)
@@c.clear_screen
@@c.assign_role
@@c.assign_name
@@c.encounter_monster
end
start
