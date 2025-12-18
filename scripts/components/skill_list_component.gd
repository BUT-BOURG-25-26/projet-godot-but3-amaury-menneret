class_name SkillListComponent

extends Node

@onready var skill_list : Dictionary = {}
@export var target : LivingEntity

func gain_skill(skill : PackedScene) -> void:
	var new_skill_handler = SkillHandler.new()
	var instance_of_skill = skill.instantiate() as Skill
	if !skill_list.has(instance_of_skill.skill_name):
		new_skill_handler.skill = instance_of_skill
		new_skill_handler.source = target
		skill_list.set(instance_of_skill.skill_name, new_skill_handler)
		add_child(new_skill_handler)
	else:
		print("ALREADY HAS SKILL")
		
func remove_skill(skill_name : String) -> void:
	if skill_list.has(skill_name):
		(skill_list.get(skill_name) as Node).queue_free()
		skill_list.erase(skill_name)

func clear_skills() -> void:
	if skill_list:
		skill_list.clear()
