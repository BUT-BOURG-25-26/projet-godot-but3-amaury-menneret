class_name PoisonVial

extends Area3D

@onready var poison_effect : Poison = Poison.new()

@export var poison_damage : int
@export var poison_ticks : int
@export var poison_cooldown : float

@export var zone_cooldown : float

func _ready() -> void:
	poison_effect.damage = poison_damage
	poison_effect.ticks = poison_ticks
	poison_effect.cooldown = poison_cooldown

func get_first_effect_list_component(target : LivingEntity) -> EffectListComponent:
	for child in target.get_children():
		if child is EffectListComponent:
			return child
	return null

func _on_body_entered(body: Node3D) -> void:
	if body is LivingEntity:
		var effect_list = get_first_effect_list_component(body)
		if effect_list :
			print("POISON -> ", body)
			effect_list.add_effect(poison_effect)
