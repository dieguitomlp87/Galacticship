extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.player_life_bar = self
	max_value = GameManager.player_max_life
	value = GameManager.player_life


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
