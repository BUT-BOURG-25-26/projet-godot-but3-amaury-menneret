class_name EffectListComponent

extends Node3D

@onready var effect_list : Dictionary = {}
@export var target : LivingEntity
@export var sprite : AnimatedSprite3D

func add_effect(effect : Effect) -> void:
	if !effect_list.has(effect):
		var effect_handler = EffectHandler.new()
		var new_effect : Effect = effect.duplicate(7)
		effect_handler.instance_of_effect = new_effect
		effect_handler.target = target
		effect_handler.parent = self
		effect_list.set(new_effect.get_unique_effect_name(), effect_handler)
		add_child(effect_handler)
	else:
		(effect_list.get(effect.get_unique_effect_name()) as EffectHandler).ticks += effect.ticks

func clear_effect(effect_name : String) -> void:
	if effect_list.has(effect_name):
		(effect_list.get(effect_name) as Node).queue_free()
		effect_list.erase(effect_name)

func clear_effects() -> void:
	if effect_list:
		effect_list.clear()
