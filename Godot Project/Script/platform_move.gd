extends Node2D
var can_move = false
var speed = 250

var top_left : Vector2
var bottom_right : Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !can_move:
		global_position = get_global_mouse_position()
		global_position.x = clampf(global_position.x, top_left.x, bottom_right.x)
		global_position.y = clampf(global_position.y, top_left.y, bottom_right.y)
	if can_move:
		global_position.x -= delta * get_node("/root/Main").platform_speed
	if (global_position.x < -230.0):
		queue_free()

func _ready():
	var screensize = get_viewport_rect().size
	var bottom = get_node("/root/Main/Button Collection/Container").position
	
	top_left = Vector2(50, 50)
	bottom_right = Vector2(screensize.x-50, bottom.y - 50)


func slow_platforms():
	get_node("/root/Main").platform_speed = speed/5
	get_node("/root/Main/Player").velocity /= 3
	get_node("/root/Main/Player").gravity = 0


func reset_platform_speeds():
	get_node("/root/Main").platform_speed = speed
	get_node("/root/Main/Player").gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
