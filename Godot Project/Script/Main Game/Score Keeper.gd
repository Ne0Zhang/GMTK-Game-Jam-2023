extends Node

signal timeout

var score: int
var orb_spawner
var score_label;

var timer = null

func _ready():
	orb_spawner = get_node("/root/Main/Orb Spawn")
	score_label = get_tree().get_root().get_node("Main").get_node("HUD/Curr Score")
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_Timer_timeout():
	score += 1
	_update_label()

func _update_label():
	score_label.text = str("SCORE: ", score, "meter")
