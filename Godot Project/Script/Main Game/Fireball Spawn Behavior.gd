extends Node

var spawnpoints = []

var fireball_obj = preload("res://Scene/Dangerous/Fireball.tscn")
var collection_dest
var main

var spawn_rate
var timer

var prev = 0

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	main = get_node("/root/Main")
	timer = main.fireball_start
	
	spawnpoints.append(get_node("point1"))
	spawnpoints.append(get_node("point2"))
	spawnpoints.append(get_node("point3"))
	spawnpoints.append(get_node("point4"))
	
	collection_dest = get_node("/root/Main/Danger Collection")

func _process(delta):
	spawn_rate = main.fireball_spawn_rate
	if (timer >= spawn_rate and main.obj_spawn):
		timer = 0.0
		_spawn_fireball(_rand_int_pick())
	timer += delta

func _spawn_fireball(pos : int):
	# Call for the object's Instantiatation
	var fireball = fireball_obj.instantiate()
	fireball.global_position = spawnpoints[pos].global_position
	# Add it to the scene in the proper collection
	collection_dest.add_child(fireball)
	

func _rand_int_pick():
	var rng = RandomNumberGenerator.new()
	var num = rng.randi_range(0,3)
	while (prev == num):
		num = rng.randi_range(0,3)
	prev = num
	return num
