class_name InstantHealSkill

extends Skill

@export var heal : float

func cast(source : LivingEntity, targets : Array[LivingEntity]) -> void :
	source.gain_health(heal)
	
func cast_requirements(source : LivingEntity, targets : Array[LivingEntity]) -> bool :
	if source is Player and source.health < source.max_health:
		return source.can_use_mana(mana_cost)
	if source is Hostile:
		return true
	return false

func cast_effects(source : LivingEntity) -> void :
	if source is Player:
		return source.use_mana(mana_cost)
