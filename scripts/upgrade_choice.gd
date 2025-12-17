class_name UpgradeChoice

extends Control

@export var button : Button
@export var texture : TextureRect
@export var label : Label

@onready var upgrade : Upgrade

func _ready() -> void:
	if upgrade:
		var color : Color
		match upgrade.tier: 
			"common":
				color = Color.GRAY
			"rare":
				color = Color.SKY_BLUE
			"legendary":
				color = Color.MEDIUM_PURPLE
			"exotic":
				color = Color.GOLD
		label.text = upgrade.title
		
		var style : StyleBoxFlat = load("res://material/rounded_corners.tres").duplicate(7)
		style.bg_color = color
		
		button.add_theme_stylebox_override("normal", style)
		button.add_theme_stylebox_override("hover", style)
		button.add_theme_stylebox_override("pressed", style)
		button.pressed.connect(chosen)

func chosen() -> void :
	GameManager.give_player_upgrade(upgrade)
