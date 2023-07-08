extends StaticBody2D

# Lower cap for the rotation
@export var min_rotate : float = -80.0
# Upper cap for the rotation
@export var max_rotate : float = 80.0
# Rotation Speed
@export var rot_speed : float = 10
# Current platform rotation
@export var curr_rotate : float = 0.0

func _input(event):
	if event is InputEventMouseButton:
		if Input.is_action_just_pressed("Rotate_Left"):
			_set_rotation(1)
		if Input.is_action_just_pressed("Rotate_Right"):
			_set_rotation(-1)

func _set_rotation(direction: float) -> void:
	curr_rotate += (direction * rot_speed)
	if curr_rotate <= min_rotate: curr_rotate = min_rotate
	if curr_rotate >= max_rotate: curr_rotate = max_rotate
	
	print(curr_rotate)
	rotation_degrees = curr_rotate

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
