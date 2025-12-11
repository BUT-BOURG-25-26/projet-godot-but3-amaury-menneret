class_name InstantHeal

extends Effect

@export var heal : int

func apply(target : LivingEntity) -> void:
	target.gain_health(heal)

func can_apply(target : LivingEntity) -> bool: 
	return target is LivingEntity and target.health < target.max_health
