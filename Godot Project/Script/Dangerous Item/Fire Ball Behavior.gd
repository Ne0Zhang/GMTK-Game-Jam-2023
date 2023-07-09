extends Node2D

# Fire Ball move in a Diaganal
var direction = Vector2(-0.9,0.8)
var bound

var anim_node

# Called when the node enters the scene tree for the first time.
func _ready():
	bound = Vector2(0, get_viewport_rect().size.y)
	anim_node = get_node("Fireball Anim")
	anim_node.play("Spin")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Fire Ball move downward from their Initiated Pos
	if(global_position.x <= bound.x or global_position.y >= bound.y+100):
		print("destroy")
		_free_Object()
	global_position.x += direction.x * get_node("/root/Main").platform_speed * delta
	global_position.y += direction.y * get_node("/root/Main").fireball_speed * delta

func _on_body_entered(body):
	if body.is_in_group("player"):
		_player_dies()

func _free_Object():
	anim_node.stop()
	queue_free()

func _player_dies():
	get_node("/root/Main")._game_over()
	print("Player died")
