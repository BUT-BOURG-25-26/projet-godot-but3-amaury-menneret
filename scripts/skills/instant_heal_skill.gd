class_name InstantHealSkill

extends Skill

@export var heal : float
@export var heal_effect : PackedScene

@onready var heal_effect_instance : InstantHeal

func _ready() -> void:
	heal_effect_instance = heal_effect.instantiate()
	heal_effect_instance.heal = heal

func cast(source : LivingEntity, targets : Array[LivingEntity]) -> void :
	var effect_list = get_first_effect_list_component(source)
	if effect_list:
		effect_list.add_effect(heal_effect_instance)
	
func cast_requirements(source : LivingEntity, targets : Array[LivingEntity]) -> bool :
	if source is Player and source.health < source.max_health:
		return source.can_use_mana(mana_cost)
	if source is Hostile:
		return true
	return false

func cast_effects(source : LivingEntity) -> void :
	if source is Player:
		return source.use_mana(mana_cost)

func get_first_effect_list_component(target : LivingEntity) -> EffectListComponent:
	for child in target.get_children():
		if child is EffectListComponent:
			return child
	return null
