extends Node2D

var player = preload("res://Scene/player.tscn")
var main

func _ready():
	main = get_node("/root/Main")
	pass

func _process(delta):
	
	pass

func _add_to_global():
	main.honey_count += 1
