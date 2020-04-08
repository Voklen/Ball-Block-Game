extends Button

func _ready():
	preload("res://Level.tscn")

func _on_Start_Button_pressed():
	get_tree().change_scene("res://Level.tscn")
