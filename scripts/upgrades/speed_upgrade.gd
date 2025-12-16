class_name SpeedUpgrade

extends Upgrade

@export var default_value : float

func apply_upgrade(player : Player) -> void:
	player.speed += default_value
	
func get_value_with_tier() -> void:
	default_value = default_value * tiers.find(tier)*0.25 + 1
