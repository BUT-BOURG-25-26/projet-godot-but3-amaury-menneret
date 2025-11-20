extends Control

class_name UpgradeChoice

@onready var button : Button = $Button

func _ready() -> void:
	button.pressed.connect(marche)

func marche() -> void:
	pass
	#GameManager.give_player_upgrade(load("res://scenes/attack/dismantle.tscn"))
