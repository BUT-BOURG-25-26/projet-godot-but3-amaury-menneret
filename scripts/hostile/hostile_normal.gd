class_name HostileNormal

extends Hostile

@export var sprite : AnimatedSprite3D
@export var movement_state_machine : StateMachine

func take_damage(value : int) -> void:
	super(value)
	if health > 0:
		movement_state_machine.current_state.Transitioned.emit(movement_state_machine.current_state, "Stunned")

func despawn():
	movement_state_machine.current_state.Transitioned.emit(movement_state_machine.current_state, "Dead")

func despawn_consequences():
	var player = target as Player
	GameManager.killcount += 1
	player.gain_mana(3)
	spawn_xp()
	queue_free()
