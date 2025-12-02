class_name HostileIdle

extends State

@export var hostile : Hostile
@export var range : float

var move_direction : Vector3

var player : Player

func enter():
	hostile.velocity = Vector3(0, hostile.velocity.y, 0)
	if(hostile is HostileBoss):
		hostile.can_attack = true
	player = get_tree().get_first_node_in_group("Player")

func exit():
	if(hostile is HostileBoss):
		hostile.can_attack = false

func Physics_Update(delta: float):
	if hostile.position.distance_to(player.position) > range:
		Transitioned.emit(self, "stalk")
