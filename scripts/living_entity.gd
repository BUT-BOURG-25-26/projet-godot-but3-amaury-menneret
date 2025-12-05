class_name LivingEntity

extends CharacterBody3D

@export var max_health : int
var health : int
@export var speed : float
@export var gravity : float = ProjectSettings.get_setting("physics/3d/default_gravity")

var direction : Vector3

signal hp_depleted

func take_damage(value : int) -> void:
	health -= value
	if(health <= 0):
		hp_depleted.emit()
	
func despawn() -> void:
	queue_free()

func _ready() -> void:
	health = max_health
	hp_depleted.connect(despawn)
	
func get_target() -> LivingEntity:
	return self
