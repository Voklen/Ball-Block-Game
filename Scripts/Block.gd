extends RigidBody

func _ready():
	Level.stop = 0
	randomize()
	var x = rand_range(-14, 14)
	randomize()
	var y = rand_range(-14, 14)
	self.global_translate(Vector3(x,20,y))

func _physics_process(delta):
	if Level.stop == 1:
		queue_free()
	if translation.y < -10:
		Level.blocksFallen += 1
		queue_free()