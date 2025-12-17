class_name ManaUpgrade

extends Upgrade

@export var default_value : int

func apply_upgrade(player : Player) -> void:
	player.max_mana += default_value
	
func get_value_with_tier() -> void:
	default_value = default_value * (tiers.find(tier) + 1)
