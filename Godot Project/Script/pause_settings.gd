extends Control
var master_bus = AudioServer.get_bus_index("Master")

@onready var options = $"."

func _ready():
	print(get_signal_connection_list)

func show_and_hide(first, second):
	first.show()
	second.hide()

func _on_fullscreen_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_back_pressed():
	pass
	

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Scene/title.tscn")


