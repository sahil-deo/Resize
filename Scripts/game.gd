extends Node2D

@onready var resizers = $CanvasLayer/resizers
@onready var player = $player
@onready var goal = $goal
@onready var main_menu = $CanvasLayer/MainMenu
@onready var pause_button = $CanvasLayer/pauseButton
@onready var menu = $CanvasLayer/menu
@onready var time = $CanvasLayer/time
@onready var speed_run_screen = $CanvasLayer/speedRunScreen
@onready var msg = $CanvasLayer/msg

var levels = [
	preload("res://Scenes/Levels/level_1.tscn"),
	preload("res://Scenes/Levels/level_2.tscn"),
	preload("res://Scenes/Levels/level_3.tscn"),
	preload("res://Scenes/Levels/level_4.tscn"),
	preload("res://Scenes/Levels/level_5.tscn"),
	preload("res://Scenes/Levels/level_7.tscn"),
	preload("res://Scenes/Levels/level_6.tscn"),
	preload("res://Scenes/Levels/level_8.tscn")
]

var level
var currentLevel: int
var gamePaused 

var speedRunMode: bool

var run: float

func _ready():

	speedRunMode = false
	gamePaused = false
	currentLevel = -1
	
	time.visible = false
	menu.visible = false
	player.visible = false
	goal.visible = false
	pause_button.visible = false
	resizers.visible = false
	msg.visible = false

func _process(delta):
	
	if speedRunMode:
		if not gamePaused: 
			speedRun()
			time.visible = true
			run += delta
	else:
		time.visible = false

func nextLevel():
	
	#Add Level Count
	currentLevel += 1
	#If Current Level is Greater than Total No. of Levels then loop back to first level
	if currentLevel == levels.size():
		
		speed_run_screen.setText("%0.2f" % run)
		
		msg.visible = false
		speedRunMode = false
		gamePaused = false
		pause_button.visible = false
		menu.visible = false
		speed_run_screen.visible = true
		
		return
	
	#Delete old Level if Any
	if get_node_or_null("level"):
		$level.queue_free()
		remove_child($level)
	
	#Add Level to Scene
	level = levels[currentLevel].instantiate()
	add_child(level)
	
	#set Level Vars
	resizers.setUps($level/LevelData.position.x)
	resizers.setDowns($level/LevelData.position.y)
	
	print(resizers.ups)
	print(resizers.downs)
	
	player.position = $level/playerPos.position
	player.setPlayer($level/LevelData.position.x, $level/LevelData.position.y)
	goal.position = $level/goalPos.position

func restartLevel():
	currentLevel -= 1
	nextLevel()
	
func loadLevel(n, mode = false):
	
	speedRunMode = mode
	run = 0
	
	$CanvasLayer/LevelSelector.visible = false
	pause_button.visible = true
	player.visible = true
	goal.visible = true
	resizers.visible = true
	
	main_menu.visible = false
	menu.visible = false
	
	currentLevel = n-1
	nextLevel()

func loadMenu():
	
	if get_node_or_null("level"):
		$level.queue_free()
		remove_child($level)
	
	main_menu.visible = true
	
	menu.visible = false
	pause_button.visible = false
	gamePaused = false
	player.visible = false
	goal.visible = false
	resizers.visible = false

func _on_menu_visibility_changed():
	print($CanvasLayer/menu.visible)

func speedRun():
	var string = "%0.1f" % run
	time.text = string
	
