class_name UpgradeChoiceMenu

extends Control

@onready var choices : Array[PackedScene] = []

func add_choice(choice : PackedScene) -> void :
	var instance_choice = choice.instantiate()
	var tile = TextureButton.new()
	#tile.texture = (instance_choice as ProjectileAttack).icon
	tile.size = Vector2(32,32)
	tile.position = Vector2(64 * choices.size(), 0)
	tile.pressed.connect(GameManager.give_player_upgrade.bind(choice))
	add_child(tile)
	choices.append(choice)
 
func _ready() -> void:
	add_choice(load("res://scenes/attack/fireball.tscn"))
	add_choice(load("res://scenes/attack/iceball.tscn"))
	add_choice(load("res://scenes/attack/fireball.tscn"))
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
