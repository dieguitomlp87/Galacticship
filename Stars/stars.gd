extends Node2D

var stars = []
var star_count := 10
@export var speed := 10

func _ready():
	var screen_size = get_viewport_rect().size

	for i in range(star_count):
		var star = Sprite2D.new()
		star.texture = preload("res://Imagenes/Universo/Strella_001.png")

		star.position = Vector2(
			randf_range(0, screen_size.x),
			randf_range(0, screen_size.y)
		)

		# velocidad individual
		star.set_meta("speed", speed)

		# tamaño aleatorio
		var scale = randf_range(0.1, 0.6)
		star.scale = Vector2(scale, scale)

		add_child(star)
		stars.append(star)
func _process(delta):
	var screen_size = get_viewport_rect().size

	for star in stars:
		var speed = star.get_meta("speed")

		star.position.y += speed * delta

		# reciclado
		if star.position.y > screen_size.y:
			star.position.y = 0
			star.position.x = randf_range(0, screen_size.x)
