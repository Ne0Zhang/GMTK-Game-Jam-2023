extends Node

var high_score = 0

var ice_count = 5
var honey_count = 3
var spring_count = 4

var platform_spawn = true
var obj_spawn = true
# Platform Related Variables
var platform_speed = 250

# Fireball Related Variables
var fireball_speed = 200.0
var fireball_spawn_rate = 6.0 # seconds

# Bomb Related Variables
var bomb_speed = platform_speed
var bomb_spawn_rate = 4.0 # seconds

var audio

func _ready():
	audio = get_node("Game Theme Music")
	audio.play()

func _game_over():
	platform_speed = 0
	fireball_speed = 0
	platform_spawn = false
	obj_spawn = false
