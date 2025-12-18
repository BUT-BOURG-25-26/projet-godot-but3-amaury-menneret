class_name SkillUpgrade

extends Upgrade

@onready var skill : Skill
@export var skills : Array[String] = [
	"res://scenes/skills/instant_heal_skill.tscn",
	"res://scenes/skills/lightning_bolt_skill.tscn",
	"res://scenes/skills/magic_arrow_skill.tscn",
	"res://scenes/skills/poison_vial_throw_skill.tscn",
	"res://scenes/skills/sword_slash_skill.tscn"
]

func _ready() -> void:
	super()
	get_random_owned_player_skill(get_tree().get_first_node_in_group("Player") as Player)
	title = skill.skill_name + " UPGRADE"

func get_random_owned_player_skill(player : Player) -> void:
	skill = player.skill_list_component.get_random_skill()

func apply_upgrade(player : Player) -> void:
	for x in tiers.find(tier):
		player.skill_list_component.upgrade_skill(skill.skill_name)
