class_name MagicArrow

extends Projectile

@export var sprite : AnimatedSprite3D
@export var hitbox : Area3D

func _ready() -> void:
	super()
	sprite.play("default")
	sprite.flip_h = direction.x < 0

func collision(body : Node3D) -> void:
	if body is Hostile:
		body.take_damage(damage)
		queue_free()
