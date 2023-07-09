extends Control

@onready var pause_settings = $"Pause Settings"
@onready var title_screen = $"Title Screen"
@onready var tutorial_screen = $tutorial
@onready var credits_screen = $credits
@onready var music = $music


@onready var logo = $"Title Screen/logo"
@onready var play = $"Title Screen/MarginContainer/HBoxContainer/Play"
@onready var tutorial = $"Title Screen/MarginContainer/HBoxContainer/Tutorial"
@onready var credits = $"Title Screen/MarginContainer/HBoxContainer/Credits"
@onready var quit = $"Title Screen/MarginContainer/HBoxContainer/Quit"



func _ready():
	title_screen.show()
	tutorial_screen.hide()
	credits_screen.hide()
	unpaused()
	expand_tween(logo)

func show_and_hide(target1, target2):
	target1.show()
	target2.hide()

func paused():
	get_tree().paused = true
	pause_settings.show()
	
func unpaused():
	pause_settings.hide()
	get_tree().paused = false

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scene/main_game.tscn")

func _on_tutorial_pressed():
	show_and_hide(tutorial_screen, title_screen)
	# get_tree().change_scene_to_file("res://Scene/tutorial.tscn")

func _on_credits_pressed():
	show_and_hide(credits_screen, title_screen)

func _on_quit_pressed():
	get_tree().quit()

func expand_tween(target):
	var tween = get_tree().create_tween()
	tween.tween_property(target, "scale", Vector2(1.1, 1.1), 0.8)
	tween.tween_property(target, "scale", Vector2(1, 1), 0.8)
	tween.set_loops()


func _on_back_from_tutorial_pressed():
	show_and_hide(title_screen, tutorial_screen)


func _on_back_from_credits_pressed():
	show_and_hide(title_screen, credits_screen)
