extends Control

class_name UpgradeChoice

@onready var button : Button = $Button
@onready var upgrade : PackedScene

func _ready() -> void:
	button.pressed.connect(chosen)

func chosen() -> void :
	GameManager.give_player_upgrade(upgrade)
