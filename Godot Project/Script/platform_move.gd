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
		global_position.x -= delta *  speed
	if (global_position.x < -230.0):
		queue_free()

func _ready():
	var screensize = get_viewport_rect().size
	var bottom = get_node("/root/Main/Button Collection/Container").position
	
	top_left = Vector2(300, 0)
	bottom_right = Vector2(screensize.x, bottom.y - 20)
