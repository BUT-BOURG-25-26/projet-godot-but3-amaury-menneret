class_name UpgradeChoice

extends Control

@onready var button : Button = $Button
@onready var texture : TextureRect = $Button/TextureRect
@onready var label : Label = $Button/Label
@onready var upgrade : PackedScene

func _ready() -> void:
	if upgrade != null:
		var skill = (upgrade.instantiate() as Skill)
		#texture.texture = attack.icon
		label.text = skill.skill_name
		button.pressed.connect(chosen)

func chosen() -> void :
	GameManager.give_player_upgrade(upgrade)
