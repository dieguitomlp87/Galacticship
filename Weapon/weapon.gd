extends Node2D

@export var bullet_scene : PackedScene
@export var bullet_scale := 1.0
@export var bullet_speed := 100
@export var fire_damage := 1.0
@export var shoot_direction := Vector2.DOWN
enum FireMode {
	SINGLE,
	TRIPLE,
	SPACING_X,
	FAN
}
@export var fire_mode: FireMode = FireMode.SINGLE
@export var spacing_x := 20
@export var shoot_spacing_x := 3
@export var shoot_fan := 5
@export var fan_angle_step := 10.0


enum Team {
	PLAYER,
	ENEMY
}

@export var team : Team = Team.ENEMY

var speed = 200


func _ready() -> void:
	pass

func shoot():
	var amount := 1
	
	match fire_mode:
		FireMode.SINGLE:
			amount = 1
		FireMode.TRIPLE:
			amount = 3
		FireMode.SPACING_X:
			amount = shoot_spacing_x
		FireMode.FAN:
			amount = shoot_fan
			
	for i in range(amount):
		var fire := bullet_scene.instantiate()
		fire.speed = bullet_speed
		fire.direction = shoot_direction
		fire.scale = Vector2(bullet_scale, bullet_scale)
		fire.team = team
		
		get_tree().current_scene.add_child(fire)
		
		match fire_mode:
			FireMode.SINGLE:
				
				if team == Team.PLAYER:
					fire.global_position = global_position + Vector2(0, -30)
				else:
					fire.global_position = global_position + Vector2(0, 30)
				
			FireMode.TRIPLE:
				
				if team == Team.PLAYER:
					fire.global_position = global_position + Vector2(0 , i * -30)
				else:
					fire.global_position = global_position + Vector2(0 , i * 30)
			FireMode.SPACING_X:
				
				var offset_x = (i - (amount -1) / 2.0) * spacing_x
				fire.global_position = global_position + Vector2(offset_x, 0)
			FireMode.FAN:
				
				var angle = (i - (amount -1) / 2.0) * fan_angle_step
				fire.direction = shoot_direction.rotated(deg_to_rad(angle))
				fire.global_position = global_position + Vector2(0, 30)
