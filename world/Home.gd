extends Button


func _on_Home_pressed():
	get_tree().change_scene("res://world/Menu.tscn")
	Global.speedrun_time = 0
	
