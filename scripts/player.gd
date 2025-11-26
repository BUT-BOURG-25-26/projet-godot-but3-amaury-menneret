class_name Player

extends LivingEntity

@export var max_mana:int = 100;
var mana:int;

@onready var attack_skills : Dictionary = { }

@export var sprite : AnimatedSprite3D
@export var ui : PlayerStats

@onready var stateMachine = $StateMachine

var xp : float = 0
var xp_to_next_level : int = 10
var level : float = 0

var enemies_in_range : Dictionary = {}

var move_inputs: Vector2

func _ready() -> void:
	full_rest()
	gain_skill(load("res://scenes/attack/fireball.tscn"))
	ui.update()

func gain_skill(attack_skill : PackedScene) -> void:
	var new_skill = AttackHandler.new()
	new_skill.attack = attack_skill
	new_skill.source = self
	attack_skills.set(attack_skills.size(),new_skill)
	add_child(new_skill)
	
func use_mana(value : int) -> bool:
	if mana - value >= 0:
		mana -= value
		ui.update()
		return true
	return false
	
func gain_mana(value : int):
	mana += value
	if mana >= max_mana:
		mana = max_mana

func _physics_process(delta: float) -> void:
	read_move_inputs()
	
	if(!is_on_floor()):
		velocity.y -= gravity * delta
		
	move_and_slide()

func get_xp(value : float):
	xp += value
	if(xp >= xp_to_next_level):
		xp = 0
		xp_to_next_level = xp_to_next_level * 1.5 as int
		level_up(1)
	if ui != null:
		ui.update()
	
func level_up(value : int):
	level += value
	max_mana *= 1.2
	full_rest()
	GameManager.onPlayerLevelUp()

func full_rest():
	mana = max_mana
	health = max_health

func read_move_inputs():
	move_inputs = Input.get_vector("left", "right", "forward", "backward")

func _input(ev):
	if Input.is_key_pressed(KEY_ESCAPE) && health > 0:
		GameManager.paused(!GameManager.pause)

func take_damage(value : int):
	health -= value
	ui.update()
	if(health <= 0):
		hp_depleted.emit()
	sprite.play("hurt")

func _on_timer_timeout() -> void:
	if mana < max_mana:
		mana += 1
		ui.update()
	if mana > max_mana:
		mana = max_mana 

func _on_hp_depleted() -> void:
	stateMachine.current_state.Transitioned.emit(stateMachine.current_state, "Dead")

func _on_detection_range_body_entered(body: Node3D) -> void:
	if body is Hostile:
		enemies_in_range.set(body, body.id)

func _on_detection_range_body_exited(body: Node3D) -> void:
	if body is Hostile:
		enemies_in_range.erase(body)
