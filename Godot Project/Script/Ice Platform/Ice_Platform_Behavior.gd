extends StaticBody2D

# Lower cap for the rotation
@export var min_rotate = -80.0
# Upper cap for the rotation
@export var max_rotate = 80.0
# Rotation Speed
@export var rot_speed = 10
# Current platform rotation
@export var curr_rotate = 0.0

# All the necessary assets/objects
var platform_sprite
var main_scene
var assoc_button
var parent

# Platform will follow mouse unless clicked and dropped
var selected = false

func _is_selected():
	await get_tree().create_timer(0.25).timeout
	selected = true

# Check for Mouse Input
func _input(event):
	# If the Mouse is pressed and the player is selection a platform,
	# change the platform's alpha, reset the button's sprite and can select another
	if event is InputEventMouseButton and selected:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false
			platform_sprite._change_alpha(1)
			main_scene.can_spawn = true
			assoc_button._reset_sprite()
			parent.can_move = true

	if event is InputEventMouseButton and selected:
		if Input.is_action_just_pressed("Rotate_Right"):
			_set_rotation(1)
		if Input.is_action_just_pressed("Rotate_Left"):
			_set_rotation(-1)

# ============ DRAG AND DROP CONTROL ============ 


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
	platform_sprite = get_node("Ice Platform Sprite")
	platform_sprite._change_alpha(.45)
	main_scene = get_node("/root/Main")
	assoc_button = get_node("/root/Main/Button Collection/Ice Spawn Button/Ice Button")
	parent = get_owner()
