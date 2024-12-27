extends CharacterBody2D
@onready var game = $".."
@onready var right = $right
@onready var left = $left
@onready var up = $up
@onready var up_left = $upLeft
@onready var up_right = $upRight
@onready var resizers = $"../CanvasLayer/resizers"
@onready var msg = $"../CanvasLayer/msg"


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var SPEED = 70.0
var JUMP_VELOCITY = -200.0

var size: int
var direction: float

var canResize: bool

var ups: int
var downs: int

func _ready():
	canResize = false

func _physics_process(delta):
	# Add the gravity.
	
	if game.gamePaused:
		return
	
	if not is_on_floor():
		velocity.y += gravity * delta	
	
	move()
	jump()
	resize()
	checkBounds()
	
	move_and_slide()
	if(Input.is_action_just_pressed("shift")):
		print(position)
	

func move():
	direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	

func jump():
	if Input.is_action_just_pressed("space") and is_on_floor():
		AudioManager.playJump()
		velocity.y = JUMP_VELOCITY
	

func resize():


	if Input.is_action_just_pressed("up") and canResize:
		
		if resizers.ups > 0:
			if scale == Vector2(1,1):
				AudioManager.playResize()
				scale = Vector2(2,2)
				resizers.de_up()

			elif scale == Vector2(2,2):
				AudioManager.playResize()
				scale = Vector2(4,4)
				resizers.de_up()
		elif resizers.ups <= 0 and get_node_or_null("../level"):
			msg.text = "You are Out of Up Resizers!"
			msg.visible = true

	elif Input.is_action_just_pressed("down"):
		
		if resizers.downs > 0:
			if scale == Vector2(2,2):
				AudioManager.playResize()
				scale = Vector2(1,1)
				resizers.de_down()
				
			elif scale == Vector2(4,4):
				AudioManager.playResize()
				scale = Vector2(2,2)
				resizers.de_down()
		elif resizers.downs <= 0 and get_node_or_null("../level"):
			msg.text = "You are Out of Down Resizers!"
			msg.visible = true

			
	match scale:
		Vector2(1,1):
			JUMP_VELOCITY = -200
		Vector2(2,2):
			JUMP_VELOCITY = -400
		Vector2(4,4):
			JUMP_VELOCITY = -800
	
	

func checkBounds():
	


	if up.is_colliding():
		canResize = false
	elif right.is_colliding() and left.is_colliding():
		canResize = false
	elif up_right.is_colliding() and up_left.is_colliding():
		canResize = false
	else:
		canResize = true

func setPlayer(u, d):
	
	ups = u
	downs = d
	size = 1
	scale = Vector2(2,2)
	
	
