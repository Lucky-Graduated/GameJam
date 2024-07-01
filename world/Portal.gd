extends Area2D


export(Resource) var Move_Player 


func _on_Portal_body_entered(_body: Player):
# warning-ignore:return_value_discarded
	get_tree().change_scene_to(Move_Player)

