class_name HostileDead

extends State

@export var hostile : Hostile

func enter():
	hostile.can_attack = false
	hostile.sprite.play("die")
	hostile.velocity = Vector3(0,0,0)

func Update(delta : float) -> void :
	if hostile is HostileNormal:
		if !hostile.sprite.is_playing():
			hostile.despawn_consequences()
	else:
		hostile.despawn()
