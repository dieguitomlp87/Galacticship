extends Node2D

@onready var pause_menu: Control = $PauseMenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pause_menu.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
