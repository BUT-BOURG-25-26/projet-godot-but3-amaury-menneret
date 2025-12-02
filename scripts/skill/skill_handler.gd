class_name SkillHandler

extends Node

@onready var skill : PackedScene
@onready var cooldown : Timer
@onready var source : LivingEntity
@onready var target : LivingEntity

@onready var instance_of_skill : Skill

func _ready() -> void:
	if skill :
		instance_of_skill = skill.instantiate()
		cooldown = Timer.new()
		cooldown.wait_time
		cooldown.timeout.connect(cooldown_done)
		cooldown.start()

func cast() -> void:
	instance_of_skill.cast_effects()
	instance_of_skill.cast()

func cooldown_done() -> void:
	print("Cooldown for " + instance_of_skill.skill_name)
	if instance_of_skill.cast_requirements():
		cast()
