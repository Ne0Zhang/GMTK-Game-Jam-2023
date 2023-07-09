extends Sprite2D

var spawn = false
var cloud_platform = preload("res://Scene/Platform Objects/cloud_platform.tscn")
var main

var audio

func _input(event):
	if event is InputEventMouseButton and event.pressed and Input.is_action_just_pressed("Clicked"):
		if get_rect().has_point(to_local(event.position)) and main.platform_spawn:
			audio.play()
			_spawn_cloud_platform()
			texture = load("res://Art Assets/Platform All Asset/Cloud Platform/cloud platform button clicked.png")

func _spawn_cloud_platform():
	main.platform_spawn = false
	
	var cloud = cloud_platform.instantiate()
	
	# add it to the scene
	get_node("/root/Main/Platform Collection").add_child(cloud)
	cloud.get_node("Cloud Platform Body")._is_selected()
	pass

func _reset_sprite():
	texture = load("res://Art Assets/Platform All Asset/Cloud Platform/cloud platform button.png")

func _ready():
	main = get_node("/root/Main")
	audio = get_node("AudioStreamPlayer2D")
