class_name HostileChase

extends State

@export var hostile : Hostile
@export var speed : float

var direction : Vector3
@onready var player : Player

func enter():
	player = get_tree().get_first_node_in_group("Player")
	pathtrace()

func pathtrace() :
	hostile.look_at(Vector3(player.position.x, hostile.position.y, player.position.z))
	direction = player.position - hostile.position
	direction = direction.normalized()
	hostile.velocity = direction * speed

func Physics_Update(delta: float):
	#if hostile.position.distance_to(player.position) > 10:
	#	Transitioned.emit(self, "Idle")
	
	if Engine.get_frames_drawn() % 2 == hostile.id % 2:
		pathtrace()
