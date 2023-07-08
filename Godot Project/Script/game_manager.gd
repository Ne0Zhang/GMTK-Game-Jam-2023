extends Node2D
var cloud = preload("res://Scene/cloud_platform.tscn")

func add_cloud_platform():
	var cloud_instance = cloud.instance()
	get_tree().get_root().add_child(cloud_instance)
