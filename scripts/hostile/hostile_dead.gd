class_name HostileDead

extends State

@export var hostile : Hostile

func enter():
	hostile.velocity = Vector3(0,0,0)
	hostile.sprite.play("die")

func Update(delta : float) -> void :
	if hostile is HostileNormal:
		if !hostile.sprite.is_playing():
			hostile.despawn_consequences()
	else:
		hostile.despawn()
