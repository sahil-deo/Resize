extends CenterContainer

@onready var label = $PanelContainer/VBoxContainer/Label
@onready var label_2 = $PanelContainer/VBoxContainer/Label2
@onready var game = $"../.."


func setText(n):
	
	if game.speedRunMode:
		label.text = "You have finished your\nrun in " + str(n) + " seconds!"
		label_2.text = "Share your score in comments to let\nothers know about it"
		
	else:
		label.text = "Thank you for playing the game!"
		label_2.text = "Let me know what you think about the\ngame in the comments!"
		
	pass


func _on_button_button_up():
	AudioManager.playClick()
	$".".visible = false
	game.loadMenu()




func _on_button_mouse_entered():
	AudioManager.playHover()
