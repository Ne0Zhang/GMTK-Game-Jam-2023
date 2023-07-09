extends Node

var high_score = 0

var ice_count = 5
var honey_count = 3
var spring_count = 4

var can_spawn = true
var game_over = false
# Player Related Variables
var player_speed = 250


var platform_spawn = true
var obj_spawn = true
# Platform Related Variables
var platform_speed = 250

# All the Spawn Rate
var fireball_start = -55.0
var bomb_start = 3
var trap_start = -6.0
var fireball_spawn_rate = 10.0 # seconds
var bomb_spawn_rate = 6.0 # seconds
var trap_spawn_rate = 15.0 # seconds

# Fireball Related Variables
var fireball_speed = 200.0


# Bomb Related Variables
var bomb_speed = platform_speed


var audio
@onready var pause_settings = $"Pause/Pause Settings"

func _ready():
	game_over = false
	audio = get_node("Game Theme Music")
	audio.play()
	pause_settings.destination = "main_game"
	unpaused()
	
func paused():
	get_tree().paused = true
	pause_settings.show()
	
func unpaused():
	pause_settings.hide()
	get_tree().paused = false

func _game_over():
	if !game_over:
		game_over = true
		audio.stop()
		audio = get_node("Game Over Music")
		audio.play()
		platform_speed = 0
		fireball_speed = 0
		platform_spawn = false
		obj_spawn = false
		await audio.finished
		print("Game Over") 
		get_tree().change_scene_to_file("res://Scene/GameOver.tscn")
