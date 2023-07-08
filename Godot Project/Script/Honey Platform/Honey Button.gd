extends Sprite2D

var spawn = false
var cloud_platform = preload("res://Scene/Platform Objects/honey_platform.tscn")
var main


func _input(event):
	if event is InputEventMouseButton and event.pressed and Input.is_action_just_pressed("Clicked"):
		if get_rect().has_point(to_local(event.position)) and main.can_spawn:
			_spawn_cloud_platform()
			texture = load("res://Art Assets/Platform All Asset/Honey Platform/honey platform button clicked.png")

func _spawn_cloud_platform():
	main.can_spawn = false
	
	var cloud = cloud_platform.instantiate()
	
	# add it to the scene
	get_node("/root/Main/Platform Collection").add_child(cloud)
	cloud.get_node("Honey Platform Body")._is_selected(true)
	pass

func _reset_sprite():
	texture = load("res://Art Assets/Platform All Asset/Honey Platform/honey platform button.png")

func _ready():
	main = get_node("/root/Main")
