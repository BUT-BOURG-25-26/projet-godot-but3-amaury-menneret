class_name HostileIdle

extends State

@export var hostile : Hostile

var move_direction : Vector3
var wander_time : float

var player : Player

func randomize_wander():
	move_direction = Vector3(randf_range(-1,1), 0, randf_range(-1,1)).normalized()
	wander_time = randf_range(1,3)

func enter():
	randomize_wander()
	player = get_tree().get_first_node_in_group("Player")

func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
		
	else:
		randomize_wander()
		
func Physics_Update(delta: float):
	if hostile:
		hostile.velocity = move_direction * hostile.speed
