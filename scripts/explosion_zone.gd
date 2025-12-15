class_name ExplosionZone

extends Area3D

@export var explosion_radius : float
@export var explosion_damage : int

@export var knockback_kick : float

@export var hitbox : CollisionShape3D
@export var debug_hitbox_visualizer : MeshInstance3D

@export var sprite : AnimatedSprite3D

func _ready() -> void:
	sprite.play("default")
	(hitbox.shape as CylinderShape3D).radius = explosion_radius
	(debug_hitbox_visualizer.mesh as CylinderMesh).top_radius = explosion_radius
	(debug_hitbox_visualizer.mesh as CylinderMesh).bottom_radius = explosion_radius

func hit_entity(entity : LivingEntity) -> void:
	entity.take_damage(explosion_damage)

func _on_body_entered(body: Node3D) -> void:
	if body is LivingEntity:
		hit_entity(body)

func _physics_process(delta: float) -> void:
	if !sprite.is_playing():
		queue_free()
