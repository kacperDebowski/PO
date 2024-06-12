extends Control
	
func _on_controlls_button_pressed():
	get_tree().change_scene_to_file("res://controls.tscn")

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
