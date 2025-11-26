class_name XpOrb

extends PickableItem

@export var xp_value : float

func on_pickup(player : Player) -> void :
	player.get_xp(xp_value)
	queue_free()
