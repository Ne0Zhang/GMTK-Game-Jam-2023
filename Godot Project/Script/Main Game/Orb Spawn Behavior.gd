extends Node

var honey_orb = preload("res://Scene/Collectable/Honey Orb.tscn")
var ice_orb = preload("res://Scene/Collectable/Ice Orb.tscn")
var spring_orb = preload("res://Scene/Collectable/Spring Orb.tscn")
var collection_dest

var spawnpoints = []
var spawn_rate = 17

var timer = 0.0
var prev = 0
var rng = RandomNumberGenerator.new()

func _ready():
	spawnpoints.append(get_node("spawn1"))
	spawnpoints.append(get_node("spawn2"))
	spawnpoints.append(get_node("spawn3"))
	collection_dest = get_node("/root/Main/Collectable Collection")

func _process(delta):
	if (timer >= spawn_rate and get_node("/root/Main").obj_spawn):
		timer = 0.0
		_spawn_orb(_rand_int_pick())
	timer += delta

func _rand_int_pick():
	var num = rng.randi_range(0,2)
	while (prev == num or num == prev - 1 or num == prev + 1):
		num = rng.randi_range(0,2)
	prev = num
	return num

func _spawn_orb(pick : int):
	var orb
	if pick == 1: orb = ice_orb.instantiate()
	elif pick == 2: orb = honey_orb.instantiate()
	elif pick == 3: orb = spring_orb.instantiate()
	
	orb.global_position = spawnpoints[rng.randi_range(0,2)].global_position
	
	collection_dest.add_child(orb)
