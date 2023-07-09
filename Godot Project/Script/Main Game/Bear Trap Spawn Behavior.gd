extends Node

var spawnpoints = []
var trap_obj = preload("res://Scene/Dangerous/trap_cloud.tscn")
var collection_dest

var main
var spawn_rate = 15
var timer
var prev = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	main = get_node("/root/Main")
	timer = main.trap_start
	collection_dest = get_node("/root/Main/Danger Collection")
	
	spawnpoints.append(get_node("/root/Main/Bomb Spawn/point2"))
	spawnpoints.append(get_node("/root/Main/Bomb Spawn/point4"))
	spawnpoints.append(get_node("/root/Main/Orb Spawn/spawn2"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spawn_rate = main.trap_spawn_rate
	
	if (timer >= spawn_rate and main.obj_spawn):
		timer = 0.0
		_spawn_trap(_rand_int_pick())
	timer += delta

func _rand_int_pick():
	var rng = RandomNumberGenerator.new()
	var num = rng.randi_range(0,2)
	while (prev == num or num == prev - 1 or num == prev + 1):
		num = rng.randi_range(0,2)
	prev = num
	return num

func _spawn_trap(pos : int):
	# Call for the object's Instantiatation
	var trap = trap_obj.instantiate()
	trap.global_position = spawnpoints[pos].global_position
	# Add it to the scene in the proper collection
	collection_dest.add_child(trap)
