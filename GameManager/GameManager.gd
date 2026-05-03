extends Node

var score :=0
var score_label: Label
var player_life_bar: ProgressBar
var player_max_life := 10.0
var player_life := 10.0

func add_points(amount: int) -> void:
	score += amount
	print("Puntos: ", score)

	if score_label != null:
		score_label.text = "PUNTOS: " + str(score)

func update_player_life(current_life: float) -> void:
	player_life = current_life
	
	if player_life_bar != null:
		player_life_bar.value = player_life
	
