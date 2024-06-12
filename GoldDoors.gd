extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		if Global.collectedGoldKeys >= 1:
			Global.collectedGoldKeys -= 1
			body.updateGoldKeyCount()
			body.win()
			queue_free()
