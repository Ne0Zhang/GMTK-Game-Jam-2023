extends Area2D

@export_enum("honey", "ice", "spring") var type: String
@export var anim_node: AnimatedSprite2D

var audio_node: AudioStreamPlayer2D
var touched = false

var player = preload("res://Scene/player.tscn")
var main

func _ready():
	main = get_node("/root/Main")
	audio_node = get_node("Pop_Audio")
	anim_node.play("Idle")

func _on_body_entered(body):
	if body.is_in_group("player"):
		_add_to_global()

func _process(delta):
	global_position.x -= delta * main.platform_speed
	if (global_position.x < -50.0):
		queue_free()

func _add_to_global():
	anim_node.play("Pop")
	audio_node.play()
	if type == "honey": main.honey_count += 1
	elif type == "ice": main.ice_count += 1
	elif type == "spring": main.spring_count += 1
	await anim_node.animation_finished
	await audio_node.finished
	queue_free()
