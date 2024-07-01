extends KinematicBody2D
class_name Player

# movement export var
export var move_speed = 200.0
export var run = 200
export var dash = 200

# jumping 
export var jump_height : float
export var jump_time_to_peak : float
export var jump_time_to_descent : float

onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0

var velocity := Vector2.ZERO

func _physics_process(delta):
	velocity.y += get_gravity() * delta
	velocity.x = get_input_velocity() * move_speed
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump()
	if Input.is_action_pressed("run") and get_input_velocity():
		velocity.x = run * get_input_velocity()
	
	velocity = move_and_slide(velocity, Vector2.UP)

func get_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity

func jump():
	velocity.y = jump_velocity

func get_input_velocity() -> float:
	var horizontal := 0.0
	
	if Input.is_action_pressed("left"):
		horizontal -= 1.0	
	elif Input.is_action_pressed("right"):
		horizontal += 1.0
	
	return horizontal


func _on_Timer_timeout():
	get_tree().change_scene("res://world/GameOver.tscn")
	Global.speedrun_time = 0
	Score.score = 0
