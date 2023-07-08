extends Control
@onready var bean = $bean

func _ready():
	bean.play("run")

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scene/title.tscn")
	
