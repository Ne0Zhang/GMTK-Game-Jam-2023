extends Control
@onready var bean = $bean

func _ready():
	bean.play("run")

