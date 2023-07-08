extends Sprite2D

var spawn = false
var cloud_platform = preload("res://Scene/cloud_platform.tscn")
var main

func _input(event):
	if event is InputEventMouseButton and event.pressed and Input.is_action_just_pressed("Clicked"):
		if get_rect().has_point(to_local(event.position)) and !spawn:
			spawn = true

func _ready():
	main = load("res://Scene/world.tscn")
