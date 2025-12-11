class_name Poison

extends Effect

@export var damage : int

func apply(target : LivingEntity) -> void:
	target.take_damage(damage)

func can_apply(target : LivingEntity) -> bool: 
	return target is LivingEntity and target.health > damage
