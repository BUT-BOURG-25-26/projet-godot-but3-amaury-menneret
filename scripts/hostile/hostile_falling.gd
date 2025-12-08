class_name HostileFalling

extends State

@export var hostile : Hostile

func enter() -> void :
	hostile.can_attack = false

func Physics_Update(delta: float):
	hostile.velocity.y = -hostile.gravity
		
	if(hostile.is_on_floor()):
		Transitioned.emit(self, "Chasing")
