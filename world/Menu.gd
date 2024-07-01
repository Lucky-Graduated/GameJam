extends Node2D

export(Resource) var load_scene


func _on_Button_pressed():
	get_tree().change_scene_to(load_scene)

func _on_Level_pressed():
	get_tree().change_scene("res://world/LevelSelection.tscn")

