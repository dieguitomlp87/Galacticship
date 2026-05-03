extends Node2D

@export var enemy_scenes : Array[PackedScene] #permite que en el inspector puedas cargar varias escenas
@export var enemy_scenes_bigship : Array[PackedScene]
@export var timer_ship: Timer
@export var timer_bigship: Timer 
 
func _ready() :
	randomize()
	
	if timer_ship != null:
		timer_ship.timeout.connect(_on_spawn_ship_timeout)
	if timer_bigship != null:
		timer_bigship.timeout.connect(_on_spawn_big_ship_timeout)

	
func spawn_enemy():
	var enemy_scene = enemy_scenes.pick_random() # de las escenas cargadas en el inspector, podes asignar una aleatoriamente.
	var enemy = enemy_scene.instantiate() # crea un instancia del enemigo y lo guarda en enemy

	var random_x = randf_range(16, 360 -16) #guarda una posicion randon de X
	
	enemy.position = Vector2(random_x, -20)
	
	get_tree().current_scene.add_child(enemy) # SE MODIFICO DEL ORIGINAL PORQUE PRODUCIA ERROR

func spawn_enemy_bigship ():
	var enemy_scenes_big_ship = enemy_scenes_bigship.pick_random()
	var enemy_big_ship = enemy_scenes_big_ship.instantiate()
	
	var random_x = randf_range(60, 360 -60)
	
	enemy_big_ship.position = Vector2(random_x, -800)
	
	get_tree().current_scene.add_child(enemy_big_ship)

func _on_spawn_big_ship_timeout() -> void:
	spawn_enemy_bigship()


func _on_spawn_ship_timeout() -> void:
	spawn_enemy()
