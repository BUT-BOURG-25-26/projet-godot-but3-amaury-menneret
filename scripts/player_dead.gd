class_name PlayerDead

extends State

@export var player : Player

func enter():
	player.sprite.play("death")
	GameManager.display_game_over(true)
