extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scene/main_game.tscn")


func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://Scene/tutorial.tscn")


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://Scene/credits.tscn")
