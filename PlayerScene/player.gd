extends CharacterBody2D
@onready var weapon: Node2D = $Weapon

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


@export var speed := 200
@export var max_life := 10.0
@export var shoot_cooldown := 0.4

enum Team {
	PLAYER,
	ENEMY
}
@export var team : Team = Team.PLAYER

var shoot_timer := 0.0
var is_dead := false
var life := 1.0
#var background_speed := 20

func _ready() -> void:
	sprite.play("idle")
	life = max_life
	GameManager.player_max_life = max_life
	GameManager.update_player_life(life)
	
func take_damage(amount) :
	life -= amount
	print("vida:", life)
	
	GameManager.update_player_life(life)
	
	if life <= 0:
		die()

func die():
	is_dead = true
	speed = 0
	sprite.play("explosion")

func _physics_process(delta) -> void:
	
	var dir = Vector2.ZERO # vector2.ZERO = vector2(0 , 0). Es una posicion, que mas adelante unidad a la velocidad "speed", genera un movimiento fluido
	
	if Input.is_action_pressed("ui_left"):
		dir.x -= 1
	if Input.is_action_pressed("ui_right"):
		dir.x += 1
	if Input.is_action_pressed("ui_up"):
		dir.y -= 1
	if Input.is_action_pressed("ui_down"):
		dir.y += 1
	
	velocity = dir.normalized() * speed #velocity es atributo de characterbody2d, de esta forma se estandariza la velocidad de movimiento ( sin speed seria super lento el desplazamiento).

	move_and_slide()
	
	shoot_timer -= delta # el tiempo empieza en el valor de shoot_cooldown, se va reduciendo hasta llegar a 0 y entra en el IF de disparo
	
	if Input.is_action_pressed("ui_shoot") and shoot_timer <= 0 : #cambio realizado para que dispare mientras se manitene apretada la barra.
		weapon.shoot()
		shoot_timer = shoot_cooldown
	
	position.x = clamp(position.x, 8, 360 - 16) #clamp limita la posicion del objeto, por ende no sale de la pantalla
	position.y = clamp(position.y, 8, 640 - 16)


func _on_animated_sprite_2d_animation_finished() -> void:
	if sprite.animation == "explosion" :
		queue_free()
		
		
#func shoot() -> void:
	#if is_dead == true:
		#return
	#var bullet = bullet_scene.instantiate()
	#bullet.position = position
	#get_parent().add_child(bullet)
