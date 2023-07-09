extends RigidBody2D

var screen_size
var velocity = Vector2.ZERO
var can_jump = false

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	if $Floor_Check.is_colliding() && $Floor_Check.get_collider().is_in_group("jump"):
		can_jump = true
	if can_jump && !$Floor_Check.is_colliding():
		velocity = Vector2(0.0, -400.0)
		linear_velocity = velocity
		can_jump = false
