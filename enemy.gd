extends CharacterBody2D

var speed = 50
var player_chase = false
var player = null

func _physics_process(delta):
	if player_chase:
		velocity = Vector2(player.position - position).normalized() * 400 * delta
		$AnimatedSprite2D.play("enemyMove")
		move_and_slide()
	else:
		$AnimatedSprite2D.play("enemyIdle")
		
func _on_sight_body_entered(body):
	player = body
	player_chase = true
 
func _on_sight_body_exited(body):
	player = null
	player_chase = false 

func _on_body_entered(body):
		if body.name == "player":
			if body.healthPoints <= 100 && body.healthPoints >= 20:
				body.healthPoints -= Global.enemyDamage
				body.updateHealthPoints()
			elif body.healthPoints < 20:
				body.dead()


