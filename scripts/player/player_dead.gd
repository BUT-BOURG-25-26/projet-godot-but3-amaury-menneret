class_name PlayerDead

extends State

@export var player : Player

func enter():
	player.velocity = Vector3(0,0,0)
	player.sprite.play("death")
	player.vulnerabilityStateMachine.current_state.Transitioned.emit(player.vulnerabilityStateMachine.current_state, "Invulnerable")

func Update(delta : float) -> void :
	if !player.sprite.is_playing():
		GameManager.display_game_over(true)
