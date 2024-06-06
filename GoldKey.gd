extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		Global.collectedGoldKeys += 1
		body.updateGoldKeyCount()
		queue_free()
