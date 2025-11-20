extends Control

class_name UpgradeChoice

@onready var button : Button = $Button
@onready var upgrade : PackedScene

func _ready() -> void:
	if upgrade != null:
		var attack = (upgrade.instantiate() as ProjectileAttack)
		#button.text = attack.attack_name
		button.icon = attack.icon
		button.pressed.connect(chosen)

func chosen() -> void :
	GameManager.give_player_upgrade(upgrade)
