class_name ProjectileAttack

extends Node3D

@export var cooldown : float = 1
@export var damage : float = 10
@export var speed : float = 30
@export var mana_cost : float = 2

@export var attack_name : String = ""

@export var sprite : AnimatedSprite3D

@onready var target : Enemy
var target_direction : Vector3

func _ready() -> void:
	target_direction = global_position.direction_to(target.global_position)

func _physics_process(delta: float) -> void:
	if(target_direction != null):
		global_position += target_direction * speed * delta
	
func _on_body_entered(body: Node3D) -> void:
	if body is Enemy:
		(body as Enemy).take_damage(damage)
		queue_free()

func _on_alive_timer_timeout() -> void:
		queue_free()
