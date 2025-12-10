class_name InstantHealth

extends Effect

@export var heal : int

func apply() -> void :
	if can_apply():
		target.gain_health(heal)
		super()
