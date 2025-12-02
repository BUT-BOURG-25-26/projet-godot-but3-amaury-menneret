class_name HostileStalk

extends State

@export var hostile : Hostile
@export var speed : float
@export var range : float

var direction : Vector3
@onready var player : Player

func enter() :
	player = get_tree().get_first_node_in_group("Player")
	pathtrace()

func pathtrace() :
	direction = player.position - hostile.position
	direction = direction.normalized()
	hostile.velocity = direction * speed

func Physics_Update(delta: float):
	if hostile.position.distance_to(player.position) > range :
		pathtrace()
	else :
		Transitioned.emit(self, "Idle")
