class_name UpgradeChoiceMenu

extends Control

signal choosen(upgrade: PackedScene)

@onready var choices : Array[PackedScene] = []
@export var upgrade_choice_scene : PackedScene

@export var possible_upgrades : Array[String] = [
	"res://scenes/skills/instant_heal_skill.tscn",
	"res://scenes/skills/lightning_bolt_skill.tscn",
	"res://scenes/skills/poison_vial_throw_skill.tscn",
	"res://scenes/skills/sword_slash_skill.tscn"
]

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

func get_random_upgrade() -> String:
	return possible_upgrades.pick_random()
	
func get_random_upgrades(nb : int) -> void:
	var upgrades:Array[String] = []
	for x in nb:
		var upgrade = get_random_upgrade()
		if !upgrades.has(upgrade):
			upgrades.append(upgrade)
		else:
			x -= 1
	for upgrade in upgrades:
		add_choice(load(upgrade))
	

func init():
	get_random_upgrades(3)
	draw()
