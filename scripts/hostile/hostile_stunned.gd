class_name HostileStunned

extends State

@export var hostile : Hostile

func enter():
	hostile.can_attack = false
	hostile.sprite.play("hurt")
	hostile.velocity = Vector3(0,0,0)

func Update(delta: float):
	if hostile is HostileNormal and !hostile.sprite.is_playing():
		Transitioned.emit(self, "Chasing")
