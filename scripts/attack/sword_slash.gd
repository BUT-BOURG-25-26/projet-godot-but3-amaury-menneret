class_name SwordSlash

extends Area3D

@export var damage : float
@export var shape : Shape3D
@export var ttl : float

@onready var source : LivingEntity

@export var sprite : AnimatedSprite3D

@export var hitbox : CollisionShape3D
@export var debug_hitbox_visualizer : MeshInstance3D

func _ready() -> void:
	hitbox.shape = shape
	var debug_shape = PlaneMesh.new()
	debug_shape.size = Vector2(shape.size.x, shape.size.z)
	debug_hitbox_visualizer.mesh = debug_shape
	var timer = Timer.new()
	timer.timeout.connect(despawn)
	add_child(timer)
	timer.start(ttl)
	sprite.play("default")
	

func despawn() -> void:
	queue_free()

func _on_body_entered(body: Node3D) -> void:
	if body is LivingEntity:
		if !(body == source):
			body.take_damage(damage)
		
