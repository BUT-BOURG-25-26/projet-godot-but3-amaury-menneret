class_name Projectile

extends Area3D

@export var speed : float = 30
@export var damage : float = 10

@onready var target_position : Vector3
var target_direction : Vector3

func _ready() -> void:
	target_direction = global_position.direction_to(target_position)
	look_at(target_position)

func _physics_process(delta: float) -> void:
	if(target_direction != null):
		global_position += target_direction * speed * delta
	
func _on_body_entered(body: Node3D) -> void:
	if body is Enemy:
		(body as Enemy).take_damage(damage)
		queue_free()

func _on_timer_timeout() -> void:
	queue_free()
