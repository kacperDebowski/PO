extends Control

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://level_1.tscn")

func _on_load_button_pressed():
	Global.loadData()

func _on_option_button_pressed():
	get_tree().change_scene_to_file("res://option_menu.tscn")
	
func _on_exit_button_pressed():
	get_tree().quit()
