extends Node2D

@export var canDamage: bool

func _on_body_entered(body):
	if canDamage:
		if body.name == "player":
			if body.healthPoints <= 100 && body.healthPoints >= 15:
				body.healthPoints -= Global.trapDamage
				body.updateHealthPoints()
			elif body.healthPoints < 15:
				body.dead()
	
func _ready():
	$AnimationPlayer.play("TrapAnimation")
