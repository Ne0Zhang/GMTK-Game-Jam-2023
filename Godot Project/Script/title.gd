extends Control

@onready var pause_settings = $"Pause Settings"
@onready var logo = $logo
@onready var play = $MarginContainer/HBoxContainer/Play
@onready var tutorial = $MarginContainer/HBoxContainer/Tutorial
@onready var credits = $MarginContainer/HBoxContainer/Credits
@onready var quit = $MarginContainer/HBoxContainer/Quit

func _ready():
	pause_settings.destination = "title"
	unpaused()
	expand_tween(logo)

func paused():
	get_tree().paused = true
	pause_settings.show()
	
func unpaused():
	pause_settings.hide()
	get_tree().paused = false

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scene/main_game.tscn")

func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://Scene/tutorial.tscn")

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://Scene/credits.tscn")

func _on_quit_pressed():
	get_tree().quit()

func expand_tween(target):
	var tween = get_tree().create_tween()
	tween.tween_property(target, "scale", Vector2(1.1, 1.1), 0.8)
	tween.tween_property(target, "scale", Vector2(1, 1), 0.8)
	tween.set_loops()
