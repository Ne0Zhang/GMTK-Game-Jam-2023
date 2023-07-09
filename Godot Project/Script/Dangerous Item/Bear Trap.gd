extends Area2D

var main
var anim
var audio

# Called when the node enters the scene tree for the first time.
func _ready():
	main = get_node("/root/Main")
	audio = get_node("Bear Trap Audio")
	anim = get_node("Bear Trap Anim")
	anim.play("Idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("player"):
		print("Player Die by Trap")
		anim.play("Trap")
		audio.play()
		main._game_over()
