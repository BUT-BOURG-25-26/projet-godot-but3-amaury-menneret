class_name PlayerRun

extends State

@export var player : Player
@export var speed : float

var direction : Vector3

var velocity : Vector3

var move_inputs: Vector2

func enter():
	player.sprite.play("run")

func Update(delta: float):
	player.sprite.flip_h = (player.move_inputs.x < 0)

func Physics_Update(delta: float):
	move_inputs = player.move_inputs
	
	if move_inputs.is_zero_approx():
		Transitioned.emit(self, "Idle")
	
	velocity.x = move_inputs.x * speed
	velocity.z = move_inputs.y * speed
	
	player.velocity = velocity
