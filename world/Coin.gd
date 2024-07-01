extends Node2D


onready var animation_player = $AnimationPlayer

export var more = 4

func _on_Area2D_area_entered(area):
	animation_player.play("Collected")
	Score.score += more
	


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
