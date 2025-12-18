class_name NewSkillUpgrade

extends Upgrade

@export var skill_scene : PackedScene
@export var skills : Array[String] = [
	"res://scenes/skills/instant_heal_skill.tscn",
	"res://scenes/skills/lightning_bolt_skill.tscn",
	"res://scenes/skills/magic_arrow_skill.tscn",
	"res://scenes/skills/poison_vial_throw_skill.tscn",
	"res://scenes/skills/sword_slash_skill.tscn"
]

func _ready() -> void:
	get_random_unowned_player_skill(get_tree().get_first_node_in_group("Player") as Player)
	title = (skill_scene.instantiate() as Skill).skill_name

func get_random_unowned_player_skill(player : Player) -> void:
	skill_scene = load(skills.pick_random()) as PackedScene
	var skill_instance = skill_scene.instantiate() as Skill
	while player.has_skill(skill_instance):
		skill_scene = load(skills.pick_random()) as PackedScene
		skill_instance = skill_scene.instantiate() as Skill

func apply_upgrade(player : Player) -> void:
	player.gain_skill(skill_scene)
