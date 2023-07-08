extends StaticBody2D

# Lower cap for the rotation
@export var min_rotate : float = -80.0
# Upper cap for the rotation
@export var max_rotate : float = 80.0
# Rotation Speed
@export var rot_speed : float = 10
# Current platform rotation
@export var curr_rotate : float = 0.0

# Different State
var rotate_state : bool = true

# = Placing Function ========================================================



# = Rotation Function =======================================================
# Read the mouse wheel input
func _unhandled_input(event):
	if event is InputEventMouseButton and rotate_state:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			_set_rotation(1)
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			_set_rotation(-1)

# Store the variable and rotate the node
func _set_rotation(direction: float) -> void:
	curr_rotate += (direction * rot_speed)
	if curr_rotate <= min_rotate: curr_rotate = min_rotate
	if curr_rotate >= max_rotate: curr_rotate = max_rotate
	
	print(curr_rotate)
	rotation_degrees = curr_rotate

# Called when the node enters the scene tree for the first time.
func _ready():
	rotation_degrees = 0.0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
#	pass
