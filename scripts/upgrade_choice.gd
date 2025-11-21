class_name UpgradeChoice

extends Control

@onready var button : Button = $Button
@onready var texture : TextureRect = $Button/TextureRect
@onready var label : Label = $Button/Label
@onready var upgrade : PackedScene

func _ready() -> void:
	if upgrade != null:
		var attack = (upgrade.instantiate() as ProjectileAttack)
		texture.texture = attack.icon
		label.text = attack.attack_name
		button.pressed.connect(chosen)

func chosen() -> void :
	GameManager.give_player_upgrade(upgrade)
