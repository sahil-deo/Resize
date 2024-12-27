extends Area2D

@onready var game = $"../.."

func _on_body_entered(body):
	
	
	if body.name == "player":
		game.restartLevel()
