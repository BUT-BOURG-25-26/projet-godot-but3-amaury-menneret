class_name EnemySpawner

extends Node3D

@onready var player : Player = get_tree().get_first_node_in_group("Player")

@export var enemy : PackedScene
@export var range : int = 20
@export var spawn_rate : float = 1.

func _ready() -> void:
	GameManager.enemySpawner = self

func _on_timer_timeout() -> void:
	for x in (spawn_rate as int):
		var scene = enemy.instantiate()
		var spawnpoint = Vector3(randf_range(-range,range),1,randf_range(-range,range))
		if(spawnpoint.distance_to(Vector3(0,0,0)) < range/2):
			spawnpoint = Vector3(randf_range(-range,range),1,randf_range(-range,range))
		scene.position = global_position + spawnpoint
		get_tree().get_current_scene().add_child(scene)

func increaseSpawnRate(value : float) -> void:
	spawn_rate = spawn_rate * value

func _physics_process(delta: float) -> void:
	global_position = player.global_position
