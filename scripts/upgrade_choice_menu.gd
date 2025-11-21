class_name UpgradeChoiceMenu

extends Control

signal choosen(upgrade: PackedScene)

@onready var choices : Array[PackedScene] = []
@export var upgrade_choice_scene : PackedScene

func add_choice(choice : PackedScene) -> void :
	choices.append(choice)
	
func draw() -> void :
	var index = 0
	for choice in choices:
		index += 1
		var up_choice : UpgradeChoice = upgrade_choice_scene.instantiate()
		up_choice.upgrade = choice
		add_child(up_choice)
		up_choice.scale = Vector2(3,3)
		up_choice.position = Vector2(((get_viewport().get_visible_rect().size.x/3) * index) - (get_viewport().get_visible_rect().size.x/3)/2 - (up_choice.size.x * 1.5), (get_viewport().get_visible_rect().size.y/2) - (up_choice.size.y * 1.5))
	
	
func init():
	add_choice(load("res://scenes/attack/fireball.tscn"))
	add_choice(load("res://scenes/attack/iceball.tscn"))
	add_choice(load("res://scenes/attack/dismantle.tscn"))
	draw()

func _on_button_pressed() -> void:
	print("pass")
	choosen.emit.bind(load("res://scenes/attack/fireball.tscn"))
