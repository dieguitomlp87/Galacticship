extends Area2D

@export var speed := 300
@export var direction := Vector2.ZERO

var damage := 1.0
var team := 1
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	position += speed * delta * direction
	
	if position.y > 700 or position.y < -10:
		queue_free()
	


func _on_body_entered(body: Node2D) -> void:
	print("BODY TOCADO: ", body.name)
	print("TIENE TAKE_DAMAGE: ", body.has_method("take_damage"))
	if body.has_method("take_damage"):
		if body.team != team :
			body.take_damage(damage)
			queue_free()


func _on_area_entered(area: Area2D) -> void:
	print("BODY TOCADO: ", area.name)
	print("TIENE TAKE_DAMAGE: ", area.has_method("take_damage"))
	if area.has_method("take_damage"):
		if area.team != team :
			area.take_damage(damage)
			queue_free()
