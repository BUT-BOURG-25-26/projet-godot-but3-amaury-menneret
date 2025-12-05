class_name HostileBoss

extends Hostile

@export var sprite : AnimatedSprite3D
@onready var can_attack : bool = false

@onready var skills : Dictionary = {}

func _ready() -> void:
	sprite.play("float")
	gain_skill(load("res://scenes/skill/magic_arrow_skill.tscn"))

func damage_entity(entity : LivingEntity):
	pass

func take_damage(value : int) -> void:
	pass

func gain_skill(skill : PackedScene) -> void:
	var new_skill_handler = SkillHandler.new()
	if !skills.has(skill):
		new_skill_handler.skill = skill
		new_skill_handler.source = self
		skills.set(skill, new_skill_handler)
		add_child(new_skill_handler)
