class_name Enemy

extends CharacterBody3D

@export var xp_value : float = 10

@export var damage : int = 1

@export var speed : float = 1.5
@export var gravity : float = 9.81
@onready var target = get_tree().get_first_node_in_group("Player")

@export var health:int = 10;

var direction : Vector3
@onready var id : int = get_instance_id()

func _ready() -> void:
	pathtrace()

func _process(delta: float) -> void:
	_despawn()
	
func pathtrace() :
	look_at(Vector3(target.position.x, position.y, target.position.z))
	direction = target.position - global_position
	direction = direction.normalized()
	velocity = direction * speed

func _physics_process(delta: float) -> void:
	if Engine.get_frames_drawn() % 2 == id % 2:
		pathtrace()
	#if(!is_on_floor()):
	#	velocity.y = -1 * gravity
	#else:
	#var distance = direction.length()
	#if distance > 0.1:
	
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() is Player:
			(collision.get_collider() as Player).take_damage(damage)
			queue_free()

func take_damage(value : int) -> void:
	health -= value
	if(health <= 0):
		health = 0
	_despawn()
	
func _despawn():
	if global_position.y < 0:
		queue_free()
	if health <= 0:
		var player = target as Player
		GameManager.killcount += 1
		player.get_xp(xp_value)
		player.gain_mana(int(xp_value * 0.1))
		queue_free()
