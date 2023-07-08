extends StaticBody2D

# Lower cap for the rotation
@export var min_rotate = -80.0
# Upper cap for the rotation
@export var max_rotate = 80.0
# Rotation Speed
@export var rot_speed = 10
# Current platform rotation
@export var curr_rotate = 0.0

var platform_sprite

# Platform will follow mouse unless clicked and dropped
var selected = true

# Check for Mouse Input
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false
			platform_sprite._change_alpha(1)
	if event is InputEventMouseButton and selected:
		if Input.is_action_just_pressed("Rotate_Left"):
			_set_rotation(1)
		if Input.is_action_just_pressed("Rotate_Right"):
			_set_rotation(-1)

# ============ DRAG AND DROP CONTROL ============ 
func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta)

# ============ MOUSE WHEEL / ROTATION CONTROL ============ 
# Set Rotation According
func _set_rotation(direction: float) -> void:
	curr_rotate += (direction * rot_speed)
	if curr_rotate <= min_rotate: curr_rotate = min_rotate
	if curr_rotate >= max_rotate: curr_rotate = max_rotate

	rotation_degrees = curr_rotate

# Called when the node enters the scene tree for the first time.
func _ready():
	curr_rotate = 0.0
	platform_sprite = get_node("Cloud Platform Sprite")
	platform_sprite._change_alpha(.45)
