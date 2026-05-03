extends Node2D

@onready var bg_1: Sprite2D = $BG1
@onready var bg_2: Sprite2D = $BG2

@export var background_speed = 30

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bg_1.position.y = 0
	bg_2.position.y = -700
	print("puto el que mensa")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	bg_1.position.y += background_speed * delta
	bg_2.position.y += background_speed * delta
	
	if bg_1.position.y >= 700 :
		bg_1.position.y = -650
	if bg_2.position.y >= 700 :
		bg_2.position.y = -650
