extends Node

var collectedCoins = 0
var collectedSilverKeys = 0
var collectedGoldKeys = 0
var collectedPotions = 0
var trapDamage = 15
var potionHealthRestored = 30
var enemyDamage = 20
signal DataLoaded(healthPoints, position)

var SavePath = "user://gameState.save"

func save(healthPoints, position):
	var file = FileAccess.open(SavePath, FileAccess.WRITE)
	
	file.store_var(healthPoints)
	file.store_var(position)
	file.store_var(collectedCoins)
	file.store_var(collectedPotions)
	file.store_var(collectedGoldKeys)
	file.store_var(collectedSilverKeys)
	
func loadData():
	var healthPoints
	var position
	if FileAccess.file_exists(SavePath):
		var file = FileAccess.open(SavePath, FileAccess.READ)
		if file:
			healthPoints = file.get_var()
			position = file.get_var()
			collectedCoins = file.get_var()
			collectedPotions = file.get_var()
			collectedGoldKeys = file.get_var()
			collectedSilverKeys = file.get_var()
			file.close()
		else:
			print("Failed to open file for reading")
			return	
	else:
		print("no data saved...")
		healthPoints = 100
		position = Vector2(368, 160) 
		collectedCoins = 0
		collectedPotions = 0
		collectedGoldKeys = 0
		collectedSilverKeys = 0
	get_tree().change_scene_to_file("res://level_1.tscn")
	DataLoaded.emit(healthPoints, position)
