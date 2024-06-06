extends CharacterBody2D

var direction = 0
var alive = true
var healthPoints = 100
@onready var deadLabel = $CanvasLayer/deadLabel

func _ready():
	$AnimatedSprite2D.play("idle")

func _process(float):
	if alive: 
		if Input.is_action_pressed("left"):
			$AnimatedSprite2D.play("run")
			velocity.x = -300
		elif Input.is_action_pressed("right"):
			$AnimatedSprite2D.play("run")
			velocity.x = 300
		elif Input.is_action_pressed("up"):
			$AnimatedSprite2D.play("run")
			velocity.y = -300
		elif Input.is_action_pressed("down"):
			$AnimatedSprite2D.play("run")
			velocity.y = 300
		else:
			velocity = Vector2.ZERO
			$AnimatedSprite2D.play("idle")
			
		direction = Input.get_axis("left", "right")
			
		if direction < 0:
			$AnimatedSprite2D.flip_h = true
		elif direction > 0:
			$AnimatedSprite2D.flip_h = false
			
		if Input.is_action_just_pressed("use"):
			healing()	
			
		move_and_slide()
			
	if Input.is_action_pressed("restart"):
		get_tree().reload_current_scene()
		
func dead():
		alive = false
		$AnimatedSprite2D.play("dead")
		deadLabel.visible = true
		
func healing():
	if healthPoints < 100:
		healthPoints += Global.potionHealthRestored
		updateHealthPoints()
		Global.collectedPotions -= 1
		updatePotionCount()
	elif healthPoints >= 100:
		pass
			
@onready var HealthPoints = $CanvasLayer/PanelContainer/MarginContainer/HBoxContainer/HealthInfo/HealtchPoints
func updateHealthPoints():
	HealthPoints.text = str(healthPoints)

@onready var CoinCount = $CanvasLayer/PanelContainer/MarginContainer/HBoxContainer/CoinInfo/CoinCount
func updateCoinCount():
	CoinCount.text = str(Global.collectedCoins)

@onready var GoldKeyCount = $CanvasLayer/PanelContainer/MarginContainer/HBoxContainer/GoldKeyInfo/GoldKeyCount
func updateGoldKeyCount():
	GoldKeyCount.text = str(Global.collectedGoldKeys)	

@onready var SilverKeyCount = $CanvasLayer/PanelContainer/MarginContainer/HBoxContainer/SilverKeyInfo/SilverKeyCount
func updateSilverKeyCount():
	SilverKeyCount.text = str(Global.collectedSilverKeys)	
	
@onready var PotionCount = $CanvasLayer/PanelContainer/MarginContainer/HBoxContainer/PotionInfo/PotionCount
func updatePotionCount():
	PotionCount.text = str(Global.collectedPotions) 
