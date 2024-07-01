extends KinematicBody2D

var velocity = Vector2.ZERO
export var direction = Vector2.RIGHT
export(int) var SPEED = 300


onready var edgecheckright = $Right
onready var edgecheckleft = $Left

func _physics_process(_delta):
	var found_wall = is_on_wall()
	var found_ledge = not edgecheckright.is_colliding() or not edgecheckleft.is_colliding()
	
	velocity = Vector2.ZERO
	if found_wall or found_ledge:
		direction *= -1

	velocity.x = SPEED * direction.x
	velocity = move_and_slide(velocity)


func _on_PlayerKiller_area_entered(_area):
	queue_free()
