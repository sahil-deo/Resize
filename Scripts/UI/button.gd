extends Sprite2D
@onready var game = $".."

var isMouseIn

var menuPause;

func _ready():
	pass
	
func _process(delta):
	
	if(isMouseIn && Input.is_action_just_released("mouseLeft")):
		menuPause = true


func _on_static_body_2d_mouse_entered():
	isMouseIn = true


func _on_static_body_2d_mouse_exited():
	isMouseIn = false
