class_name HostileBoss

extends Hostile

@export var sprite : AnimatedSprite3D

func _ready() -> void:
	sprite.play("default")

func damage_entity(entity : LivingEntity):
	pass

func take_damage(value : int) -> void:
	pass
