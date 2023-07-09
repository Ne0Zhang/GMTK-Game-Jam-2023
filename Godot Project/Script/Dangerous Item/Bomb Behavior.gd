extends Node2D

# Fire Ball move in a Diaganal
var direction = Vector2(-1,0)
var bound
var speed

var audio_node
var anim_node
var played = true

# Called when the node enters the scene tree for the first time.
func _ready():
	bound = Vector2(0, get_viewport_rect().size.y)
	anim_node = get_node("Bomb_Anim")
	anim_node.play("Idle")
	audio_node = get_node("Explode_Audio")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	# Fire Ball move downward from their Initiated Pos
	if(global_position.x <= bound.x - 100):
		_free_object()
	global_position.x += direction.x * get_node("/root/Main").platform_speed * delta

func _on_body_entered(body):
	if body.is_in_group("player"):
		print("Player Die by Explosion")
		_explode()

func _free_object():
	anim_node.stop()
	print("Bomb Destroy")
	queue_free()

# If player touches bomb, bomb explode and dies
func _explode():
	get_node("/root/Main")._game_over()
	anim_node.play("Explode")
	audio_node.play()
	await anim_node.animation_finished
	anim_node.visible = false
	await audio_node.finished
	queue_free()
