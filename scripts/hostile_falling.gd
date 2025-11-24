class_name HostileFalling

extends State

@export var hostile : Hostile

func Physics_Update(delta: float):
	if !hostile.is_on_floor():
		hostile.velocity.y = -hostile.gravity
		
	if(hostile.is_on_floor()):
		Transitioned.emit(self, "Chase")
