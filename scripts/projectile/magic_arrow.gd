class_name MagicArrow

extends Projectile

@export var sprite : AnimatedSprite3D
@export var hitbox : Area3D

func _ready() -> void:
	super()
	sprite.flip_h = direction.x < 0
	var camera : Camera3D = get_viewport().get_camera_3d()
	sprite.play("default")

func collision(body : Node3D) -> void:
	if body is HostileNormal:
		body.take_damage(damage)
		queue_free()
