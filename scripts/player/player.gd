class_name Player

extends LivingEntity

@export var max_mana:int = 100;
var mana:int;

@export var sprite : AnimatedSprite3D
@export var ui : PlayerStats

@export var movementStateMachine : StateMachine
@export var vulnerabilityStateMachine : StateMachine

@export var skill_list_component : SkillListComponent

var xp : float = 0
var xp_to_next_level : int = 10
var level : float = 1

var enemies_in_range : Array[Hostile] = []

var move_inputs: Vector2

func _ready() -> void:
	full_rest()
	gain_skill(load("res://scenes/skills/magic_arrow_skill.tscn"))
	#gain_skill(load("res://scenes/skills/instant_heal_skill.tscn"))
	#gain_skill(load("res://scenes/skills/sword_slash_skill.tscn"))
	#gain_skill(load("res://scenes/skills/poison_vial_throw_skill.tscn"))
	#gain_skill(load("res://scenes/skills/lightning_bolt_skill.tscn"))
	ui.update()

func gain_skill(skill : PackedScene) -> void:
	if skill_list_component:
		skill_list_component.gain_skill(skill)

func use_mana(value : int) -> void:
	mana -= value
	ui.update()
	
func can_use_mana(value : int) -> bool:
	if mana - value >= 0:
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
		level_up(1)
	if ui != null:
		ui.update()
	
func level_up(value : int):
	level += value
	xp = 0
	xp_to_next_level = xp_to_next_level * 1.2 as int
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
	if vulnerabilityStateMachine.current_state == $VulnerabilityStateMachine/Vulnerable:
		health -= value
		if(health <= 0):
			health = 0
		ui.update()
		if(health <= 0):
			vulnerabilityStateMachine.current_state.Transitioned.emit(vulnerabilityStateMachine.current_state, "Invulnerable")
			hp_depleted.emit()
		else :
			movementStateMachine.current_state.Transitioned.emit(movementStateMachine.current_state, "Stunned")

func _on_timer_timeout() -> void:
	if mana < max_mana:
		mana += 1
		ui.update()
	if mana > max_mana:
		mana = max_mana 

func _on_hp_depleted() -> void:
	movementStateMachine.current_state.Transitioned.emit(movementStateMachine.current_state, "Dead")

func _on_detection_range_body_entered(body: Node3D) -> void:
	if body is Hostile:
		enemies_in_range.append(body)

func _on_detection_range_body_exited(body: Node3D) -> void:
	if body is Hostile:
		enemies_in_range.erase(body)

func _on_item_pick_up_range_body_entered(body: Node3D) -> void:
	if body is PickableItem:
		body.on_pickup(self)

func get_target() -> LivingEntity:
	if enemies_in_range.size() > 0:
		return enemies_in_range.pick_random()
	else :
		return self
		
func has_skill(skill_name : String) -> bool:
	return skill_list_component.has_skill(skill_name)
