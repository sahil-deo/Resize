extends Node2D

@onready var game = $"../.."
@onready var main_menu = $"../MainMenu"


func _ready():
	$".".visible = false

func _process(delta):
	if visible:
		main_menu.visible = false
		

func _on_back_button_button_up():
	main_menu.visible = true
	$".".visible = false
	AudioManager.playClick()
	

func _on_level_1_button_up():
	game.loadLevel(0)
	AudioManager.playClick()

func _on_level_2_button_up():
	game.loadLevel(1)
	AudioManager.playClick()

func _on_level_3_button_up():
	game.loadLevel(2)
	AudioManager.playClick()

func _on_level_4_button_up():
	game.loadLevel(3)
	AudioManager.playClick()

func _on_level_5_button_up():
	game.loadLevel(4)
	AudioManager.playClick()

func _on_level_6_button_up():
	game.loadLevel(5)
	AudioManager.playClick()

func _on_level_7_button_up():
	game.loadLevel(6)
	AudioManager.playClick()

func _on_level_8_button_up():
	game.loadLevel(7)
	AudioManager.playClick()

func _on_speed_run_mode_button_up():
	game.loadLevel(0, true)
	AudioManager.playClick()




func _on_level_1_mouse_entered():
	AudioManager.playHover()


func _on_level_2_mouse_entered():
	AudioManager.playHover()


func _on_level_3_mouse_entered():
	AudioManager.playHover()


func _on_level_4_mouse_entered():
	AudioManager.playHover()


func _on_level_5_mouse_entered():
	AudioManager.playHover()


func _on_level_6_mouse_entered():
	AudioManager.playHover()


func _on_speed_run_mode_mouse_entered():
	AudioManager.playHover()


func _on_back_button_mouse_entered():
	AudioManager.playHover()



func _on_level_7_mouse_entered():
	AudioManager.playHover()


func _on_level_8_mouse_entered():
	AudioManager.playHover()


