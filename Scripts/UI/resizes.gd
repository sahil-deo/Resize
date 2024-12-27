extends Node2D

@onready var up = $up/up
@onready var down = $down/down

var downs: int
var ups: int

func setUps(n):
	ups = n
	
func setDowns(n):
	downs = n

func de_down():
	downs -= 1
	
func de_up():
	ups -= 1
	
func _process(delta):
	up.text = str(ups)
	down.text = str(downs)
	
	if ups <= 0:
		up.add_theme_color_override("font_color", Color.RED)
	if downs <= 0:
		down.add_theme_color_override("font_color", Color.RED)
		
	if ups > 0:
		up.add_theme_color_override("font_color", Color.BLACK)
	if downs > 0:
		down.add_theme_color_override("font_color", Color.BLACK)
		
