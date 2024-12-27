extends Node2D

@onready var _bgm = $BGM
@onready var _jump = $Jump
@onready var _pick_up = $PickUp
@onready var _resize = $Resize
@onready var _hover = $Hover
@onready var _click = $Click

var _mute:bool 

func mute():
	if not _mute:
		_mute = true
		_bgm.stop()
	else:
		_mute = false
		_bgm.play()

func _ready():
	print("teh")
	_mute = false
	playBgm()

func playJump():
	if _mute:
		return
	
	_jump.play()

func playBgm():
	if _mute:
		return
	_bgm.play()

func playPickUp():
	if _mute:
		return
	_pick_up.play()

func playResize():
	if _mute:
		return
	_resize.play()

func playHover():
	if _mute:
		return
	_hover.play()
	
func playClick():
	if _mute:
		return
	_click.play()
