class_name Hostile

extends LivingEntity
 
@export var xp_value : float = 10

@export var damage : int = 1

@onready var target = get_tree().get_first_node_in_group("Player")

@onready var id : int = get_instance_id()

func _ready() -> void:
	pass
	#pathtrace()

func _process(delta: float) -> void:
	_despawn()

func _physics_process(delta: float) -> void:
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
	if health <= 0:
		var player = target as Player
		GameManager.killcount += 1
		player.get_xp(xp_value)
		player.gain_mana(int(xp_value * 0.1))
		queue_free()
