extends Spatial

var blocksFallen = 0
var stop = 0

func _ready():
	var minWaitTime = 1
	var maxWaitTime = 10
	yield(get_tree().create_timer(5), "timeout")
#	$ Win.hide()
	while true:
		randomize()
		summonBlock()	
		yield(get_tree().create_timer(rand_range(minWaitTime, maxWaitTime)), "timeout")

func summonBlock():
	var scene = load("res://Assets/Block.tscn")
	var sceneInstance = scene.instance()
	add_child(sceneInstance)
