extends Control

@onready var main_menu = $"../MainMenu"

func closeIntro():
	main_menu.visible = true
	$".".queue_free()
