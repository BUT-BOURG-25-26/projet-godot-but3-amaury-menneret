class_name UpgradeChoiceMenu

extends Control

signal choosen(upgrade: PackedScene)

@onready var choices : Array[PackedScene] = []
@export var upgrade_choice_scene : PackedScene

func add_choice(choice : PackedScene) -> void :
	#var instance_choice = choice.instantiate()
	#var tile : Button = Button.new()
	##tile.texture = (instance_choice as ProjectileAttack).icon
	#tile.text = "click connard"
	#tile.size = Vector2(32,32)
	#tile.position = Vector2(64 * choices.size(), 0)
	##tile.pressed.connect(choosen.emit.bind(choice))
	#tile.pressed.connect(printsomestuff)
	##tile.connect("pressed", _printsomestuff)
	#add_child(tile)
	#tile.pressed.connect(printsomestuff)
	#
	#tile.visible = true
	#choices.append(choice)
	
	var up_choice : UpgradeChoice = upgrade_choice_scene.instantiate()
	add_child(up_choice)
	up_choice.position = Vector2(128 * choices.size(), 0)
	choices.append(choice)
	
func init():
	add_choice(load("res://scenes/attack/fireball.tscn"))
	add_choice(load("res://scenes/attack/iceball.tscn"))
	add_choice(load("res://scenes/attack/fireball.tscn"))

func printsomestuff() :
	print("haha")

#func _ready() -> void:
	#visible = false
	#add_choice(load("res://scenes/attack/fireball.tscn"))
	#add_choice(load("res://scenes/attack/iceball.tscn"))
	#add_choice(load("res://scenes/attack/fireball.tscn"))
	#process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	#choosen.connect(GameManager.give_player_upgrade)

func _on_button_pressed() -> void:
	print("pass")
	choosen.emit.bind(load("res://scenes/attack/fireball.tscn"))
