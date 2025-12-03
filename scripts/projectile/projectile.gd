class_name Projectile

extends Node3D

@export var damage : float
@export var time_to_live : float = 1
@export var speed : float
@onready var direction : Vector3

func _ready() -> void:
	if time_to_live:
		var timer = Timer.new()
		add_child(timer)
		timer.timeout.connect(timed_out)
		timer.start(time_to_live)
	look_at(direction * speed)

func timed_out() -> void:
	queue_free()

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
