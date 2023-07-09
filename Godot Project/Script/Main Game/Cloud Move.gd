extends Sprite2D

@export_enum("cloud", "sky") var type: String

var speed
var spawnpoint
# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Speed depends on the option selected
	if type == "cloud":
		speed = 85
	elif type == "sky": 
		speed = 0
	
	spawnpoint = get_node("/root/Main/Cloud Spawn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.x -= speed * delta
	if global_position.x <= 0:
		global_position.x = spawnpoint.global_position.x
