class_name HostileChase

extends State

@export var hostile : Hostile
@export var speed : float

var direction : Vector3
@onready var player : Player

func enter():
	hostile.can_attack = true
	hostile.sprite.play("walk")
	player = get_tree().get_first_node_in_group("Player")
	pathtrace()

func pathtrace() :
	direction = player.position - hostile.position
	direction = direction.normalized()
	hostile.velocity = direction * speed
	if hostile is HostileNormal:
		hostile.sprite.flip_h = direction.x < 0

func Physics_Update(delta: float):
	if Engine.get_frames_drawn() % 2 == hostile.id % 2:
		pathtrace()
	
	if !hostile.is_on_floor():
		Transitioned.emit(self, "falling")
