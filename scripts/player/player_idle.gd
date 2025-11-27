class_name PlayerIdle

extends State

@export var player : Player
@export var speed : float = 5

var move_inputs: Vector2
var velocity : Vector3

func enter():
	player.sprite.play("idle")

func Physics_Update(delta: float):
	
	if not player.move_inputs.is_zero_approx():
		Transitioned.emit(self, "Run")
