extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		Global.collectedCoins += 1
		body.updateCoinCount()
		queue_free()
