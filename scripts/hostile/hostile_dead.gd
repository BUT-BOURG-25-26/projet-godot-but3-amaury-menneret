class_name HostileDead

extends State

@export var hostile : Hostile

func enter():
	var player : Player = get_tree().get_first_node_in_group("Player")
	if player.enemies_in_range.has(hostile):
		player.enemies_in_range.erase(hostile)
	GameManager.active_enemy_nb -= 1
	hostile.can_attack = false
	hostile.sprite.play("die")
	hostile.velocity = Vector3(0,0,0)

func Update(delta : float) -> void :
	if hostile is HostileNormal:
		if !hostile.sprite.is_playing():
			hostile.despawn_consequences()
	else:
		hostile.despawn()
