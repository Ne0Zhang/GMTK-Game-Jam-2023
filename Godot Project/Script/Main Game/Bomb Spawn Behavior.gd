extends Node

var spawnpoints = []

var bomb_obj = preload("res://Scene/Dangerous/Bomb.tscn")
var collection_dest
var main

var spawn_rate
var timer

var prev = 0

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	main = get_node("/root/Main")
	timer = main.bomb_start
	
	spawnpoints.append(get_node("point1"))
	spawnpoints.append(get_node("point2"))
	spawnpoints.append(get_node("point3"))
	spawnpoints.append(get_node("point4"))
	spawnpoints.append(get_node("point5"))
	
	collection_dest = get_node("/root/Main/Danger Collection")

func _process(delta):
	spawn_rate = main.bomb_spawn_rate
	if (timer >= spawn_rate and main.obj_spawn):
		timer = 0.0
		_spawn_fireball(_rand_int_pick())
	timer += delta

func _spawn_fireball(pos : int):
	# Call for the object's Instantiatation
	var bomb = bomb_obj.instantiate()
	bomb.global_position = spawnpoints[pos].global_position
	# Add it to the scene in the proper collection
	collection_dest.add_child(bomb)
	
# When picking rand int, they have to pick a number that is
# not the prev number or there neighbor
func _rand_int_pick():
	var rng = RandomNumberGenerator.new()
	var num = rng.randi_range(0,4)
	while (prev == num or num == prev - 1 or num == prev + 1):
		num = rng.randi_range(0,4)
	prev = num
	return num
