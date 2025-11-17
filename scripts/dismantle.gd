extends ProjectileAttack

@onready var camera = get_viewport().get_camera_3d()

func _ready() -> void:
	look_at(camera.position)
	global_position = target.global_position

func _physics_process(delta: float) -> void:
	pass
