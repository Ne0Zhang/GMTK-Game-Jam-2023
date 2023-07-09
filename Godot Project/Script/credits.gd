extends Control

@onready var pause_settings = $"Pause Settings"

func _ready():
	pause_settings.destination = "credits"
	unpaused()

func paused():
	get_tree().paused = true
	pause_settings.show()
	
func unpaused():
	pause_settings.hide()
	get_tree().paused = false

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scene/title.tscn")
	
