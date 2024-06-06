extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		Global.collectedSilverKeys += 1
		body.updateSilverKeyCount()
		queue_free()
