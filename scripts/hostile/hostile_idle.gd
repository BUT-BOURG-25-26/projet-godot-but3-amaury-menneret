class_name HostileIdle

extends State

@export var hostile : Hostile
@export var range : float

var move_direction : Vector3

var player : Player

func enter():
	hostile.can_attack = true
	hostile.velocity = Vector3(0, hostile.velocity.y, 0)
	player = get_tree().get_first_node_in_group("Player")

func exit():
	hostile.can_attack = false

func Physics_Update(delta: float):
	if hostile.position.distance_to(player.position) > range:
		Transitioned.emit(self, "stalk")
