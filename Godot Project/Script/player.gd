extends CharacterBody2D

var screen_size
var can_jump = false
var speed = 250
var jump_speed = -400.0
var oingo_speed = -600.0
var is_boinging = false
var touched_ice = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	velocity.y += gravity * delta

	if position.x < 500:
		speed = 250

	if position.x > 500: 
		speed = 50

	if $Floor_Check.is_colliding():
		var groups = $Floor_Check.get_collider().get_groups()
		velocity.x = speed
		match groups:
			["jump",..]:
				can_jump = true
				touched_ice = false
				is_boinging = false
			["ice",..]:
				touched_ice = true
				is_boinging = false
				velocity.x += speed
			["boingo",..]:
				is_boinging = true
				touched_ice = false
				var direction = $Floor_Check.get_collider().rotation
				velocity = Vector2(0.0, oingo_speed).rotated(direction)

	if can_jump && !$Floor_Check.is_colliding():
		can_jump = false
		velocity.y = jump_speed

	if !is_on_floor() && !touched_ice && !is_boinging:
		velocity.x = 0

	position.x = clamp(position.x, 0, screen_size.x)

	move_and_slide()
