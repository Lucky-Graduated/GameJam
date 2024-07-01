extends Node2D



func _on_Retry_pressed():
	get_tree().change_scene("res://world/World.tscn")
	Global.speedrun_time = 0
	Score.score = 0
