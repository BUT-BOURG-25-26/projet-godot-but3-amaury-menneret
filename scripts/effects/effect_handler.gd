class_name EffectHandler

extends Node

@onready var cooldown : Timer
@onready var ticks : int
@onready var target : LivingEntity

@onready var instance_of_effect : Effect

@onready var parent : EffectListComponent = self.get_parent()

func _ready() -> void:
	if instance_of_effect :
		ticks = instance_of_effect.ticks
		cooldown = Timer.new()
		cooldown.timeout.connect(cooldown_done)
		cooldown.wait_time = instance_of_effect.cooldown
		add_child(cooldown)
		add_child(instance_of_effect)
		cooldown_done()
		cooldown.start()

func add_ticks(add_ticks : int) -> void:
	if add_ticks > 0:
		ticks += add_ticks
		cooldown.wait_time = instance_of_effect.cooldown

func apply() -> void:
	instance_of_effect.apply(target)
	ticks -= 1
	if ticks <= 0:
		remove()

func can_apply() -> bool:
	if ticks > 0:
		return target and instance_of_effect.can_apply(target)
	else:
		return false

func cooldown_done() -> void:
	if can_apply():
		apply()

func remove() -> void:
	parent.clear_effect(instance_of_effect.get_unique_effect_name())
