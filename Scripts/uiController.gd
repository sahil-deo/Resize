extends Node
@onready var menu = $"../CanvasLayer/menu"


@onready var game = $".."

func _on_button_button_up():
	
	AudioManager.playClick()
	if(not game.gamePaused):
		game.gamePaused = true
	else:
		game.gamePaused = false

func _process(delta):
	if game.gamePaused:
		menu.visible = true
	else:
		menu.visible = false
