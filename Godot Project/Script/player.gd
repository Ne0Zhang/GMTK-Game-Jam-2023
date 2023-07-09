extends CharacterBody2D

var screen_size
var form = 0
var floor_checked = false
var can_jump = false
var speed = 250
var jump_speed = -400.0
var oingo_speed = -600.0
var is_boinging = false
var touched_ice = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var audio_src: AudioStreamPlayer2D
var playrun = false
var main

func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite2D.animation = "run"
	if !playrun:
		playrun = true
		audio_src = get_node("PlayerWalk")
		audio_src.play()
	$The_Poofer.animation = "poof"
	$AnimatedSprite2D.play()
	main = get_node("/root/Main")

func _physics_process(delta):
	velocity.y += gravity * delta

	if position.x < 500:
		speed = 250

	if position.x > 500: 
		speed = 50
	
	if position.y > get_viewport_rect().size.y or position.x < 0:
		main._game_over()

	if $Floor_Check.is_colliding():
		var groups = $Floor_Check.get_collider().get_groups()
		velocity.x = speed
		if !floor_checked:
			match groups:
				["jump",..]:
					if !playrun:
						_play_run_audio()
					$AnimatedSprite2D.animation = "run"
					if form != 0:
						$The_Poofer.play()
					$AnimatedSprite2D.play()
					can_jump = true
					touched_ice = false
					is_boinging = false
					form = 0
				["ice",..]:
					_play_audio("slide")
					$AnimatedSprite2D.animation = "ice"
					if form != 1:
						$The_Poofer.play()
					$AnimatedSprite2D.play()
					velocity.x += speed
					touched_ice = true
					is_boinging = false
					form = 1
				["boingo",..]:
					_play_audio("spring")
					is_boinging = true
					touched_ice = false
					var direction = $Floor_Check.get_collider().rotation
					velocity = Vector2(0.0, oingo_speed).rotated(direction)
					$AnimatedSprite2D.animation = "jump"
					if form != 0:
						$The_Poofer.play()
					$AnimatedSprite2D.play()
				["honey",..]:
					_play_audio("honey")
					print_debug("in honey")
			floor_checked = true

	if can_jump && !$Floor_Check.is_colliding():
		_play_audio("jump")
		$AnimatedSprite2D.animation = "jump"
		$AnimatedSprite2D.play()
		can_jump = false
		velocity.y = jump_speed

	if !is_on_floor() && !touched_ice && !is_boinging:
		velocity.x = 0
	
	if !$Floor_Check.is_colliding():
		floor_checked = false
		if touched_ice:
			$AnimatedSprite2D.animation = "ice_fall"

	position.x = clamp(position.x, 0, screen_size.x)

	move_and_slide()
	
func _play_run_audio():
	audio_src.stop()
	playrun = true
	audio_src = get_node("PlayerWalk")
	audio_src.play()

func _play_audio(state : String):
	audio_src.stop()
	playrun = false
	match state:
		"jump": 
			audio_src = get_node("PlayerJump")
		"slide": 
			audio_src = get_node("PlayerSlide")
		"spring": 
			audio_src = get_node("PlayerSpring")
		"honey":
			audio_src = get_node("PlayerHoney")
	audio_src.play()
	
