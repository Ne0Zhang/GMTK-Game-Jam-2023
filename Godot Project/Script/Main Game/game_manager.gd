extends Node

var ice_count = 5
var honey_count = 3
var spring_count = 4

var can_spawn = true

# Platform Related Variables
var platform_speed = 250

# Fireball Related Variables
var fireball_speed = 200.0
var fireball_spawn_rate = 6.0 # seconds

# Bomb Related Variables
var bomb_speed = platform_speed
var bomb_spawn_rate = 4.0 # seconds



func can_spawn_state(state : bool):
	can_spawn = state
