class_name HostileBoss

extends Hostile

@export var sprite : AnimatedSprite3D

@export var skill_list_component : SkillListComponent

func _ready() -> void:
	sprite.play("float")
	gain_skill(load("res://scenes/skills/magic_arrow_skill.tscn"))

func damage_entity(entity : LivingEntity):
	pass

func take_damage(value : int) -> void:
	pass

func gain_skill(skill : PackedScene) -> void:
	if skill_list_component:
		skill_list_component.gain_skill(skill)
