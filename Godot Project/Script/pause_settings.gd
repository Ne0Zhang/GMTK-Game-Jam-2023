extends Control
var master_bus = AudioServer.get_bus_index("Master")
@export var destination: String
@onready var mouseClick = $"../mouseClick"
# @onready var fullscreen_checkbox = $OptionsButtons/HBoxContainer/ChecksSliders/Fullscreen

func _on_fullscreen_toggled(button_pressed):
	mouseClick.play()
	if button_pressed:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif !button_pressed:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Scene/title.tscn")


