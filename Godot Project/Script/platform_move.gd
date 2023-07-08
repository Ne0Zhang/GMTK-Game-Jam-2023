extends Node2D
var can_move = false
var speed = 250

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !can_move:
		global_position = get_global_mouse_position()
	if can_move:
		global_position.x -= delta *  speed
		print(global_position.x)
	if (global_position.x < -300.0):
		queue_free()
