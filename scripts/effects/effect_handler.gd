class_name EffectHandler

extends Node

@onready var effect : PackedScene
@onready var cooldown : Timer
@onready var ticks : int
@onready var source : LivingEntity

@onready var instance_of_effect : Effect

func _ready() -> void:
	if effect :
		instance_of_effect = effect.instantiate()
		cooldown = Timer.new()
		cooldown.wait_time = instance_of_effect.cooldown
		cooldown.timeout.connect(cooldown_done)
		add_child(cooldown)
		add_child(instance_of_effect)
		cooldown.start()

func apply() -> void:
	instance_of_effect.cast(source)
	ticks -= 1

func can_apply() -> bool:
	if ticks > 0:
		return source and instance_of_effect.can_apply(source)
	else:
		return false

func cooldown_done() -> void:
	if can_apply():
		apply()
