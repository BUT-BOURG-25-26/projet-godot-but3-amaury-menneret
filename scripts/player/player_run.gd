class_name PlayerRun

extends State

@export var player : Player
@export var speed : float

var direction : Vector3

var velocity : Vector3

var move_inputs: Vector2

func enter():
	if player:
		speed = player.speed
		player.sprite.play("run")

func Update(delta: float):
	player.sprite.flip_h = floor(((player.move_inputs.x) + (player.move_inputs.y))/2) < 0

func Physics_Update(delta: float):
	move_inputs = player.move_inputs
	
	if move_inputs.is_zero_approx():
		Transitioned.emit(self, "Idle")
	
	velocity.x = move_inputs.x * speed
	velocity.z = move_inputs.y * speed
	
	player.velocity = velocity
