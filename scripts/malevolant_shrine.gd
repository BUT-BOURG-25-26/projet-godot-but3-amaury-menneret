extends Area3D

@export var range : float = 10
@export var attack : PackedScene
var targets

func _ready() -> void:
	targets = []

func _on_body_entered(body: Node3D) -> void:
	if body is Enemy:
		targets.append(body)

func _on_body_exited(body: Node3D) -> void:
	if targets.has(body):
		targets.erase(body)


func _on_cooldown_timeout() -> void:
	for x in targets:
		var scene = attack.instantiate()
		scene.global_position = global_position
		scene.target = x
		get_tree().get_current_scene().add_child(scene)
