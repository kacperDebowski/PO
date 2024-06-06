extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		Global.collectedPotions += 1
		body.updatePotionCount()
		queue_free() 
