extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		if Global.collectedSilverKeys >= 1:
			Global.collectedSilverKeys -= 1
			body.updateSilverKeyCount()
			queue_free()
