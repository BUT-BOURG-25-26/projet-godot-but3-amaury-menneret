class_name SkillHandler

extends Node

@onready var skill : PackedScene
@onready var cooldown : Timer
@onready var source : LivingEntity

@onready var targets : Dictionary

@onready var instance_of_skill : Skill

func _ready() -> void:
	if skill :
		instance_of_skill = skill.instantiate()
		cooldown = Timer.new()
		cooldown.wait_time
		cooldown.timeout.connect(cooldown_done)
		add_child(cooldown)
		add_child(instance_of_skill)
		cooldown.start()

func cast() -> void:
	instance_of_skill.cast_effects()
	instance_of_skill.cast(source, request_target())

func cooldown_done() -> void:
	if instance_of_skill.cast_requirements(source, request_target()):
		cast()

func request_target() -> LivingEntity :
	return source.get_target()
