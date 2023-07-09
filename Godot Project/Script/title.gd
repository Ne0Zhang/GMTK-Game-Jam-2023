extends Control

@onready var pause_settings = $"Pause Settings"

func _ready():
	unpaused()

func paused():
	get_tree().paused = true
	pause_settings.show()
	print("paused")
	
func unpaused():
	pause_settings.hide()
	get_tree().paused = false
	print("unpaused")

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scene/main_game.tscn")

func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://Scene/tutorial.tscn")

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://Scene/credits.tscn")

func _on_quit_pressed():
	get_tree().quit()

