class_name LightningBolt

extends Area3D

@export var speed : float
@onready var applied_speed : float = 0
@export var explosion_scene : PackedScene

@export var sprite : AnimatedSprite3D

func _ready() -> void:
	sprite.play("default")

func _physics_process(delta: float) -> void:
	position.y -= applied_speed
	if position.y <= 0 + 2/2:
		explode_at_coordinates(Vector2(position.x, position.z))

func explode_at_coordinates(coordinates : Vector2) -> void:
	var explosion_instance : ExplosionZone = explosion_scene.instantiate()
	explosion_instance.position = Vector3(coordinates.x, 0, coordinates.y)
	get_tree().get_current_scene().add_child(explosion_instance)
	queue_free()

func _on_timer_timeout() -> void:
	applied_speed = speed
