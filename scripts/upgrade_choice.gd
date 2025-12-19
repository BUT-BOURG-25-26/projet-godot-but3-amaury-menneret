class_name UpgradeChoice

extends Control

@export var button : Button
@export var texture : TextureRect
@export var label : Label

@onready var upgrade : Upgrade

func _ready() -> void:
	if upgrade:
		var player = get_tree().get_first_node_in_group("Player")
		upgrade.init(player)
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
		var alternate_style : StyleBoxFlat = style.duplicate(7)
		alternate_style.bg_color = color.lightened(0.15)
		
		button.add_theme_stylebox_override("normal", style)
		button.add_theme_stylebox_override("hover", alternate_style)
		button.add_theme_stylebox_override("pressed", style)
		button.pressed.connect(chosen)

func chosen() -> void :
	if upgrade.can_upgrade:
		GameManager.give_player_upgrade(upgrade)
