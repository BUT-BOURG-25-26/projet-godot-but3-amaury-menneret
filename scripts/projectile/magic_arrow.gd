class_name MagicArrow

extends Projectile

@export var sprite : AnimatedSprite3D

func _ready() -> void:
	sprite.play("default")
	#super()
