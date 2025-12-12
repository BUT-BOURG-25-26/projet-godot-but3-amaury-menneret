class_name Poison

extends Effect

@export var damage : int

func apply(target : LivingEntity) -> void:
	target.take_damage(damage)

func can_apply(target : LivingEntity) -> bool: 
	return target is LivingEntity and target.health > damage

func get_unique_effect_name() -> String :
	return effect_name + "_" + str(damage) + "_" + str(cooldown)
