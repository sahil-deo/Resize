extends CenterContainer

@onready var game = $"../.."
@onready var main_menu = $"."
@onready var level_selector = $"../LevelSelector"
@onready var mute = $PanelContainer/VBoxContainer/VB/Mute



func _on_play_button_up():
	
	main_menu.visible = false
	level_selector.visible = true
	AudioManager.playClick()
	print(main_menu.visible)

func _on_quit_button_up():
	get_tree().quit()


func _on_play_mouse_entered():
	AudioManager.playHover()


func _on_quit_mouse_entered():
	AudioManager.playHover()


func _on_mute_mouse_entered():
	AudioManager.playHover()


func _on_mute_button_up():
	
	AudioManager.playClick()
	
	AudioManager.mute()
	
	if AudioManager._mute:
		mute.text = "Unmute"
	else:
		mute.text = "Mute"
		
