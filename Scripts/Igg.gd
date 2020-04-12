extends KinematicBody

var velocity = Vector3()
var gravity = 1.8
var friction = 0.06
var acceleration = 1
var maxSpeed = 7
var gameOverAt_y = -20


func _ready():
	pass


func _physics_process(delta):
	if translation.y < gameOverAt_y:
		Level.stop = 1
		get_tree().change_scene("res://Lose.tscn")
	
	if Input.is_action_pressed("ui_right"):
		if velocity.x < maxSpeed:
		 velocity.x += acceleration
	if Input.is_action_pressed("ui_left"):
		if velocity.x > -maxSpeed:
		 velocity.x -= acceleration
	if Input.is_action_pressed("ui_down"):
		if velocity.z < maxSpeed:
		 velocity.z += acceleration
	if Input.is_action_pressed("ui_up"):
		if velocity.z > -maxSpeed:
		 velocity.z -= acceleration
	
	velocity.x = lerp(velocity.x,0,friction)
	velocity.z = lerp(velocity.z,0,friction)
	rotateBall(velocity.z,0,-velocity.x)
	velocity += Vector3(0,-gravity,0) * delta
	move_and_slide(velocity)


func rotateBall(x,y,z):
	$ MeshInstance.rotate_x(deg2rad(x))
	$ MeshInstance.rotate_y(deg2rad(y))
	$ MeshInstance.rotate_z(deg2rad(z))
