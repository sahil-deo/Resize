extends CenterContainer

@onready var game = $"../.."


func _on_restart_button_up():
	AudioManager.playClick()
	game.gamePaused = false
	game.restartLevel()
	

func _on_resume_button_up():
	AudioManager.playClick()
	game.gamePaused = false


func _on_quit_button_up():
	
	game.speedRunMode = false
	
	AudioManager.playClick()
	game.loadMenu()
	
	
func _on_restart_mouse_entered():
	AudioManager.playHover()


func _on_resume_mouse_entered():
	AudioManager.playHover()


func _on_quit_mouse_entered():
	AudioManager.playHover()
