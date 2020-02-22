extends Label

var PointsToWin = 15

func _ready():
	text = "0"

func _process(delta):
	text = String(Level.blocksFallen)
	if Level.blocksFallen >= PointsToWin:
		Level.stop = 1
		get_tree().change_scene("res://WinScreen.tscn")