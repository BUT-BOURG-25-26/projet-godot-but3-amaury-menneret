class_name Upgrade

extends Node

@export var title : String
@export var description : String
@export var tier : String = "common"

var tiers : Array[String] = [
	"common",
	"rare",
	"legendary",
	"exotic"
]

func _ready() -> void:
	get_random_tier()
	get_value_with_tier()

func apply_upgrade(player : Player) -> void:
	pass

func get_random_tier() -> void:
	tier = tiers.pick_random()

func get_value_with_tier() -> void:
	pass
