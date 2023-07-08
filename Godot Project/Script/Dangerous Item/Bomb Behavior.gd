extends Node2D

# Fire Ball move in a Diaganal
var direction = Vector2(-1,0)
var bound

var anim_node

# Called when the node enters the scene tree for the first time.
func _ready():
	bound = Vector2(0, get_viewport_rect().size.y)
	anim_node = get_node("Bomb_2D/Bomb_Anim")
	anim_node.play("Idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Constant Update with Main's Speed
	var speed = get_node("/root/Main").bomb_speed
	
	# Fire Ball move downward from their Initiated Pos
	if(global_position.x <= bound.x - 100):
		_free_object()
	global_position.x += direction.x * speed * delta

func _free_object():
	anim_node.stop()
	print("Bomb Destroy")
	queue_free()

# If player touches bomb, bomb explode and dies
func _explode():
	anim_node.play("Explode")
	await anim_node.animation_finished
	queue_free()
