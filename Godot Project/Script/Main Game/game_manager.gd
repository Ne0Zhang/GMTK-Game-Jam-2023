extends Node

var can_spawn = true
# Fireball Related Variables
var fireball_speed = 200.0
var fireball_spawn_rate = 6.0 # seconds

# Platform Related Variables
var platform_speed = 250

func can_spawn_state(state : bool):
	can_spawn = state
