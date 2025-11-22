class_name HostileChase

extends State

@export var hostile : Hostile
@export var speed : float

var player : Player

func Enter():
	player = get_tree().get_first_node_in_group("Player")

func pathtrace() :
	hostile.look_at(Vector3(player.position.x, hostile.position.y, player.position.z))
	hostile.direction = player.position - hostile.global_position
	hostile.direction = hostile.direction.normalized()
	hostile.velocity = hostile.direction * speed

func _physics_process(delta: float) -> void:
	pass
	#if hostile.global_position.distance_to(player.global_position) >= 10:
	#	Transitioned.emit(self, "idle")
	
	#if Engine.get_frames_drawn() % 2 == hostile.id % 2:
		#pathtrace()
