extends Node2D

func _on_pause_menu_save_pressed():
	var healthPoints = $player.healthPoints
	var position = $player.position
	
	Global.save(healthPoints, position)
	
func _ready():
	Global.DataLoaded.connect(onDataLoaded)
	
func onDataLoaded(healthPoints, position):
	$player.healthPoints = healthPoints
	$player.position = position
