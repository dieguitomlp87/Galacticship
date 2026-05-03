extends Area2D
class_name Cannon

@onready var weapon: Node2D = $Weapon
@export var max_life := 5
@export var rotate_speed := 30.0
enum Team {
	PLAYER,
	ENEMY
}

@export var team: Team = Team.ENEMY
@export var points := 100
var life := 1
var is_dead := false

func _ready() -> void:
	life = max_life


func _process(delta: float) -> void:
	if is_dead:
		return
	#rotation_degrees += rotate_speed * delta
	
func take_damage(amount: int) -> void:
	life -= amount
	print("Vida", life)
	
	if life <= 0:
		die()

func die() -> void:
	is_dead = true
	GameManager.add_points(points)
	queue_free()


func _on_timer_timeout() -> void:
	weapon.shoot()
