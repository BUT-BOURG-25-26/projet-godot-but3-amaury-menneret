class_name Player
extends CharacterBody3D

@export var gravity:float = ProjectSettings.get_setting("physics/3d/default_gravity");
@export var speed:float = 1.5;

@export var max_mana:int = 10;
var mana:int;

@export var max_health:int = 10;
var health:int;

@export var projectile : PackedScene

@export var ui : PlayerStats

@onready var _animated_sprite = $AnimatedSprite3D
@onready var camera = get_viewport().get_camera_3d()

var xp : float = 0
var xp_to_next_level : int = 10
var level : float = 0

var kill_count : int = 0

var enemies_in_range

var move_inputs: Vector2

func _ready() -> void:
	enemies_in_range = []
	health = max_health
	mana = max_mana

func _process(delta: float) -> void:
	read_move_inputs()
	if move_inputs.x > 0:
		_animated_sprite.play("run_right") #if speed > 0 else _animated_sprite.play("idle_right")
	if move_inputs.x < 0:
		_animated_sprite.play("run_left") #if speed > 0 else _animated_sprite.play("idle_left")
	if move_inputs.y > 0:
		_animated_sprite.play("run_facing") #if speed > 0 else _animated_sprite.play("idle_facing")
	if move_inputs.y < 0:
		_animated_sprite.play("run_front") #if speed > 0 else _animated_sprite.play("idle_front")
		
	if velocity.is_zero_approx():
		_animated_sprite.play("idle_facing")
		
	(_animated_sprite as AnimatedSprite3D).look_at(camera.position)

func _physics_process(delta: float) -> void:
	read_move_inputs()
	
	if(!is_on_floor()):
		velocity.y -= gravity * delta
		
	velocity.x = move_inputs.x * speed
	velocity.z = move_inputs.y * speed
		
	move_and_slide()

func get_xp(value : float):
	xp += value
	if(xp >= xp_to_next_level):
		xp = 0
		xp_to_next_level = xp_to_next_level * 1.5 as int
		level_up(1)
	ui.update()
	
func level_up(value : int):
	level += value
	full_rest()
	GameManager.onPlayerLevelUp()

func full_rest():
	mana = max_mana
	health = max_health

func read_move_inputs():
	if !GameManager.pause:
		move_inputs = Input.get_vector("left", "right", "forward", "backward")
	
func take_damage(value : int):
	health -= value
	if(health < 0):
		health = 0
	if health <= 0:
		GameManager.display_game_over(true)

func _on_timer_timeout() -> void:
	if(enemies_in_range.size() > 0):
		for x in enemies_in_range.size():
			if mana >= 2:
				mana -= 2
				var scene = projectile.instantiate()
				scene.global_position = global_position
				scene.target_position = enemies_in_range.get(x).global_position
				get_tree().get_current_scene().add_child(scene)

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Enemy:
		enemies_in_range.append(body)


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body is Enemy:
		enemies_in_range.erase(body)


func _on_timer_2_timeout() -> void:
	if mana < max_mana:
		mana += 1
	if mana > max_mana:
		mana = max_mana 
