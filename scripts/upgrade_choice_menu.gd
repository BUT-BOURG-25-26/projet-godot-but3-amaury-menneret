class_name UpgradeChoiceMenu

extends Control

signal choosen(upgrade: PackedScene)

@onready var choices : Array[PackedScene] = []
@export var upgrade_choice_scene : PackedScene

func add_choice(choice : PackedScene) -> void :
	var up_choice : UpgradeChoice = upgrade_choice_scene.instantiate()
	up_choice.upgrade = choice
	add_child(up_choice)
	up_choice.position = Vector2(128 * choices.size(), 0)
	choices.append(choice)
	
func init():
	add_choice(load("res://scenes/attack/fireball.tscn"))
	add_choice(load("res://scenes/attack/iceball.tscn"))
	add_choice(load("res://scenes/attack/dismantle.tscn"))

func _on_button_pressed() -> void:
	print("pass")
	choosen.emit.bind(load("res://scenes/attack/fireball.tscn"))
