class_name PlayerHurt

extends State

@export var player : Player

func switch_idle():
	Transitioned.emit(self, "Idle")

func enter() :
	player.sprite.play("Hurt")
	player.sprite.animation_finished.connect(switch_idle)
