extends Button

export(Resource) var Move_Player 


func _on_Button_pressed():
	get_tree().change_scene_to(Move_Player)
