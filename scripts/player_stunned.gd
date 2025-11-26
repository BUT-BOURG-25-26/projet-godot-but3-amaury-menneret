class_name PlayerStunned

extends State

@export var player : Player

func enter():
	player.vulnerabilityStateMachine.current_state.Transitioned.emit(player.vulnerabilityStateMachine.current_state, "Invulnerable")
	player.sprite.play("hurt")
	player.velocity = Vector3(0,0,0)

func exit():
	player.vulnerabilityStateMachine.current_state.Transitioned.emit(player.vulnerabilityStateMachine.current_state, "Vulnerable")

func Physics_Update(delta: float):
	if !player.sprite.is_playing():
		Transitioned.emit(self, "Idle")
