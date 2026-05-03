extends Control

@onready var menu: VBoxContainer = $Menu
@onready var pause_button: TextureButton = $PauseButton


func _ready():
	menu.visible = false

func _on_pause_button_pressed():
	get_tree().paused = true
	menu.visible = true
	pause_button.visible = false

func _on_continue_button_pressed():
	get_tree().paused = false
	menu.visible = false
	pause_button.visible = true

func _on_exit_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://MainMenu/main_menu.tscn")
	
