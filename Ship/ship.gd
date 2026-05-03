extends CharacterBody2D

@onready var weapon: Node2D = $Weapon
#@export var bullet_scene : PackedScene
@export var max_life := 2
@export var speed_y := 50.0
@export var speed_x := 100.0
enum Team {
	PLAYER,
	ENEMY
}
@export var team : Team = Team.ENEMY
@export var points := 100
var direction_x := 0
var is_dead := false
var life := 0

func _ready() -> void:
	life = max_life
	#global_position = Vector2([10, 300].pick_random(), 10) LA CREACION ALEATORIA  LA GENERA LA ESCENA SPAWNER
	

func _physics_process(_delta: float) -> void:
	velocity.x = direction_x * speed_x
	velocity.y = speed_y
	position.x = clamp(position.x, 8, 360 - 16)
	move_and_slide()
	
	if position.y > 720 :
		queue_free()
		
func take_damage(amount) :
	life -= amount
	print("vida:", life)
	
	if life <= 0:
		die()

func die():
	is_dead = true
	speed_x = 0
	speed_y = 0
	GameManager.add_points(points)
	queue_free()
	
#func shoot(): EL DISPARO LOS PRODUCE LA ESCENA WEAPON
#
	#var fire := bullet_scene.instantiate()
	#fire.global_position = global_position	
	#get_parent().add_child(fire)
	
func _on_timer_timeout() -> void:
	direction_x = [-1, 1].pick_random()


func _on_timer_2_timeout() -> void:
	
	weapon.shoot() #Va a seguir a la nave, cuando la usas en un main, los bullets dejan de seguri a la nave.
	
