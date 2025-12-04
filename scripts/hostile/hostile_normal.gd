class_name HostileNormal

extends Hostile

@export var sprite : AnimatedSprite3D
@export var movement_state_machine : StateMachine

func take_damage(value : int) -> void:
	movement_state_machine.current_state.Transitioned.emit(movement_state_machine.current_state, "Stunned")
	super(value)

func despawn():
	sprite.play("die")
	super()
