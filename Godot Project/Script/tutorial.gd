extends Control
@onready var bean = $bean
@onready var pause_settings = $"Pause Settings"

func _ready():
	pause_settings.destination = "tutorial"
	bean.play("run")
	unpaused()

func paused():
	get_tree().paused = true
	pause_settings.show()
	
func unpaused():
	pause_settings.hide()
	get_tree().paused = false
	
func _on_back_pressed():
	$".".hide()
	
