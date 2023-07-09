extends Label

var score = 0
var score_label
var timer = 0.0

var main

# Called when the node enters the scene tree for the first time.
func _ready():
	main = get_node("/root/Main")
	print(main.high_score)
	score_label = get_node(".")
	_print_score()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (timer >= 2 and !main.game_over):
		timer = 0.0
		score += 5
		_print_score()
	timer += delta
	
	if (main.game_over):
		main.high_score = score

func _print_score():
	score_label.text = str("SCORE: ", score, " METER(S)")
