extends Area2D
class_name BigShip

@export var max_life = 10
@export var speed_y := 30
@export var limit_y := 1600
enum Team {
	PLAYER,
	ENEMY
}

@export var team: Team = Team.ENEMY
@export var points := 100

var is_dead = false
var life = 1

func _ready() -> void:
	life = max_life

func take_damage(amount: int) -> void:
	life -= amount
	print("Vida BiShip: ", life)
	
	if life <= 0:
		die()

func _process(delta: float) -> void:
	position.y += speed_y * delta
	
	if position.y > limit_y:
		queue_free()

func die():
	is_dead = true
	speed_y = 0
	GameManager.add_points(points)
	queue_free()


func _on_timer_timeout() -> void:
	pass # Replace with function body.
