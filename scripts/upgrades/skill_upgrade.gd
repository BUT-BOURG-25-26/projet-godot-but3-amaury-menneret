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

func can_init(player : Player) -> bool:
	var player_has_any_skill = false
	for skill in skills:
		if player.has_skill((load(skill).instantiate() as Skill).skill_name):
			player_has_any_skill = true
			break
	return player_has_any_skill 

func init(player : Player) -> void:
	super(player)
	get_random_owned_player_skill(player)
	title = skill.skill_name + " upgrade"

func get_random_owned_player_skill(player : Player) -> void:
	skill = player.skill_list_component.get_random_skill()

func apply_upgrade(player : Player) -> void:
	for x in tiers.find(tier):
		player.skill_list_component.upgrade_skill(skill.skill_name)
