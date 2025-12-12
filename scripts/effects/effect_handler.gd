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
		add_child(cooldown)
		add_child(instance_of_effect)
		cooldown.start(0.01)
		cooldown.wait_time = instance_of_effect.cooldown

func add_ticks(add_ticks : int) -> void:
	if add_ticks > 0:
		ticks += add_ticks
		#cooldown.set_paused(false)
		#cooldown.start(0.01)
		cooldown.wait_time = instance_of_effect.cooldown

func apply() -> void:
	print("APPLY", instance_of_effect, " REMAINING TICKS : ", ticks)
	instance_of_effect.apply(target)
	ticks -= 1
	if ticks <= 0:
		#cooldown.stop()
		print("SHOULD REMOVE ", instance_of_effect)
		#remove()

func can_apply() -> bool:
	if ticks > 0:
		return target and instance_of_effect.can_apply(target)
	else:
		return false

func cooldown_done() -> void:
	print("TRY AND APPLY ", instance_of_effect)
	if can_apply():
		apply()

func remove() -> void:
	print("REMOVE ", self)
	parent.clear_effect(instance_of_effect)
