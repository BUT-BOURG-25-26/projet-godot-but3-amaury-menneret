class_name EffectListComponent

extends Node3D

@onready var effect_list : Dictionary = {}
@export var target : LivingEntity
@export var sprite : AnimatedSprite3D

func add_effect(effect : PackedScene) -> void:
	if !effect_list.has(effect):
		var effect_handler = EffectHandler.new()
		
		effect_list.set(effect, effect_handler)

func clear_effect(effect : Effect) -> void:
	if effect_list.has(effect):
		effect_list.erase(effect)

func clear_effects() -> void:
	if effect_list:
		effect_list.clear()
