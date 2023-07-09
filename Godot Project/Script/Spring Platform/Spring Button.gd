extends Sprite2D

var spawn = false
var cloud_platform = preload("res://Scene/Platform Objects/spring_platform.tscn")
var main


var spring_label;
var audio

func _input(event):
	if event is InputEventMouseButton and event.pressed and Input.is_action_just_pressed("Clicked"):
		if get_rect().has_point(to_local(event.position)) and main.platform_spawn and main.spring_count > 0:
			audio.play()
			_spawn_cloud_platform()
			texture = load("res://Art Assets/Platform All Asset/Spring Platform/spring platform button clicked.png")

func _spawn_cloud_platform():
	main.platform_spawn = false
	_drop_count()
	_print_count()
	var cloud = cloud_platform.instantiate()
	
	# add it to the scene
	get_node("/root/Main/Platform Collection").add_child(cloud)
	cloud.get_node("Spring Platform Body")._is_selected()
	pass

func _reset_sprite():
	texture = load("res://Art Assets/Platform All Asset/Spring Platform/spring platform button.png")

func _ready():
	main = get_node("/root/Main")
	spring_label = get_tree().get_root().get_node("Main").get_node("HUD/Spring Count")
	audio = get_node("AudioStreamPlayer2D")
	_print_count()

func _process(delta):
	_print_count()

func _drop_count():
	main.spring_count -= 1

func _print_count():
	spring_label.text = str(main.spring_count)

