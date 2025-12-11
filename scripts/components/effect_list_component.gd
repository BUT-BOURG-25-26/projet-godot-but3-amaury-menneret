class_name EffectListComponent

extends Node3D

@onready var effect_list : Dictionary = {}
@export var target : LivingEntity
@export var sprite : AnimatedSprite3D

func add_effect(effect : Effect) -> void:
	if !effect_list.has(effect):
		var effect_handler = EffectHandler.new()
		effect_handler.instance_of_effect = effect
		effect_handler.target = target
		effect_handler.parent = self
		effect_list.set(effect, effect_handler)
		add_child(effect_handler)
	else:
		(effect_list.get(effect) as EffectHandler).ticks += effect.ticks

func clear_effect(effect : Effect) -> void:
	if effect_list.has(effect):
		(effect_list.get(effect) as Node).queue_free()
		effect_list.erase(effect)

func clear_effects() -> void:
	if effect_list:
		effect_list.clear()
