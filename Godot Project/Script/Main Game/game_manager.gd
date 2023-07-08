extends Node

var can_spawn = true
var fireball_speed = 200.0
var platform_speed = 250

func can_spawn_state(state : bool):
	can_spawn = state
