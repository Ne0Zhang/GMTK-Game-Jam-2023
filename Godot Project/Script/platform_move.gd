extends Node2D
var can_move = false
var speed = 250
var screensize
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !can_move:
		global_position = get_global_mouse_position()
		global_position.x = clampf(global_position.x, 300.0, screensize.x)
		global_position.y = clampf(global_position.y, 80, screensize.y-160)
	if can_move:
		global_position.x -= delta *  speed
		print(global_position.x)
	if (global_position.x < -230.0):
		queue_free()

func _ready():
	screensize = get_viewport_rect().size
