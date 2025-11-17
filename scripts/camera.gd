extends Camera3D

@onready var player : Player = get_tree().get_first_node_in_group("Player")
@export var fov_camera : float = 3.0

func _process(delta: float) -> void:
	position = player.position + Vector3(0, fov_camera, fov_camera)
	look_at(player.position)
