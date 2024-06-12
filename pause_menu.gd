extends Control

signal savePressed 

func _ready():
	$AnimationPlayer.play("RESET")

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func Esc():
	if Input.is_action_just_pressed("esc"):
		if get_tree().paused:
			resume()
		else:
			pause()

func _on_resume_button_pressed():
	resume()

func _on_restart_button_pressed():
	resume()
	get_tree().reload_current_scene()

func _on_save_button_pressed():
	savePressed.emit()

func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")

func _process(delta):
	Esc()



