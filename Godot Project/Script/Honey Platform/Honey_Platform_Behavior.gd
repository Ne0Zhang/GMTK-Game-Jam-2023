extends Area2D

signal in_honey
signal out_honey

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
var audio_src : AudioStreamPlayer2D

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
			main_scene.platform_spawn = true
			assoc_button._reset_sprite()
			parent.can_move = true
			$CollisionShape2D.set_deferred("disabled", false)

# Called when the node enters the scene tree for the first time.
func _ready():
	curr_rotate = 0.0
	platform_sprite = get_node("Honey Platform Sprite")
	platform_sprite._change_alpha(.45)
	main_scene = get_node("/root/Main")
	assoc_button = get_node("/root/Main/Button Collection/Honey Spawn Button/Honey Button")
	parent = get_owner()
	audio_src = get_node("honey audio")
	$CollisionShape2D.set_deferred("disabled", true)


func _on_body_entered(body):
	if body.is_in_group("player"):
		audio_src.play()
		in_honey.emit()


func _on_body_exited(body):
	if body.is_in_group("player"):
		audio_src.stop()
		out_honey.emit()
