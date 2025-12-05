class_name Hostile

extends LivingEntity
 
@export var xp_scene : PackedScene

@export var damage : int = 1

@onready var target = get_tree().get_first_node_in_group("Player")

@onready var id : int = get_instance_id()

func _physics_process(delta: float) -> void:
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() is Player:
			damage_entity((collision.get_collider() as Player))

func damage_entity(entity : LivingEntity):
	entity.take_damage(damage)
	queue_free()
	
func spawn_xp() -> void:
	var xp = xp_scene.instantiate() as XpOrb
	xp.position = position
	get_tree().current_scene.add_child(xp)

func despawn():
	if health <= 0:
		var player = target as Player
		GameManager.killcount += 1
		player.gain_mana(3)
		spawn_xp()
		queue_free()

func get_target() -> LivingEntity :
	var player : Player = get_tree().get_first_node_in_group("Player")
	if player:
		return player 
	else:
		return self
