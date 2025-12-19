class_name EnemySpawner

extends Node3D

@onready var player : Player = get_tree().get_first_node_in_group("Player")

@export var enemy : PackedScene
@export var range : int = 20
@export var spawn_rate : float = 1

@export var difficulty_setting : float = 0

func _ready() -> void:
	GameManager.enemySpawner = self

func _on_timer_timeout() -> void:
	for x in (spawn_rate as int):
		if GameManager.can_spawn_new_enemy() :
			var scene = enemy.instantiate() as Hostile
			var spawnpoint = Vector3(randf_range(-range,range),1,randf_range(-range,range))
			if(spawnpoint.distance_to(Vector3(0,0,0)) < range/2):
				spawnpoint = Vector3(randf_range(-range,range),1,randf_range(-range,range))
			scene.position = global_position + spawnpoint
			scene.damage += difficulty_setting * 2
			scene.speed += 0.33 * difficulty_setting
			scene.max_health += difficulty_setting * 5
			scene.health = scene.max_health
			get_tree().get_current_scene().add_child(scene)
			GameManager.active_enemy_nb += 1
			await get_tree().create_timer(3/spawn_rate).timeout

func increaseSpawnRate(value : float) -> void:
	spawn_rate = spawn_rate * value

func increase_difficulty(value : float) -> void:
	difficulty_setting += value

func _physics_process(delta: float) -> void:
	global_position = player.global_position
