class_name UpgradeChoiceMenu

extends Control

signal choosen(upgrade: PackedScene)

@onready var upgrades : Dictionary = {}
@export var upgrade_choice_scene : PackedScene

@export var possible_upgrades : Array[String] = [
	"res://scenes/upgrades/health_upgrade.tscn",
	"res://scenes/upgrades/mana_upgrade.tscn",
	"res://scenes/upgrades/new_skill_upgrade.tscn",
	"res://scenes/upgrades/speed_upgrade.tscn",
	"res://scenes/upgrades/skill_upgrade.tscn"
]

func add_upgrade_choice(upgrade_choice : Upgrade) -> void :
	if !upgrades.has(upgrade_choice.title):
		upgrades.set(upgrade_choice.title, upgrade_choice)
		add_child(upgrade_choice)
	
func draw() -> void :
	var index = 1
	for choice in upgrades.values():
		var up_choice : UpgradeChoice = upgrade_choice_scene.instantiate()
		up_choice.upgrade = choice
		add_child(up_choice)
		up_choice.scale = Vector2(3,3)
		up_choice.position = Vector2(((get_viewport().get_visible_rect().size.x/3) * index ) - (get_viewport().get_visible_rect().size.x/3)/2 - (up_choice.size.x * 1.5), (get_viewport().get_visible_rect().size.y/2) - (up_choice.size.y * 1.5))
		index += 1

func get_random_upgrade() -> Upgrade:
	return (load(possible_upgrades.pick_random()) as PackedScene).instantiate()
	
func get_random_upgrades(nb : int) -> void:
	var upgrades_to_be_added:Dictionary = {}
	for x in nb:
		var possible_upgrade = get_random_upgrade()
		if !upgrades_to_be_added.has(possible_upgrade.title) and possible_upgrade.can_init:
			upgrades_to_be_added.set(possible_upgrade.title, possible_upgrade)
		else :
			while upgrades_to_be_added.has(possible_upgrade.title):
				possible_upgrade = get_random_upgrade()
			upgrades_to_be_added.set(possible_upgrade.title, possible_upgrade)
	for comming_upgrade in upgrades_to_be_added.values():
		add_upgrade_choice(comming_upgrade)
	

func init():
	get_random_upgrades(3)
	draw()
