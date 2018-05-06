extends KinematicBody2D

export (int) var speed = 200
export (float) var jumpHeight = 100
export (float) var jumpDuration = 0.5

var jumpTimer = 0.0
var desiredHeight = 0.0

var jumping = false
var grounded = false
var moving = false;

var velocity = Vector2()
var xInput = 0.0

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	
	if Input.is_action_just_pressed('jump') && grounded:
		jump()
	xInput = 0
	if Input.is_action_pressed('move_left'):
		xInput -= 1
	if Input.is_action_pressed('move_right'):
		xInput += 1
		
	if abs(xInput) > 0:
		moving = true;
		var animator = get_child(0)
		if xInput < 0:
			animator.flip_h = true
		if xInput > 0:
			animator.flip_h = false
	
	updateAnimation()
	
	pass
	

func jump():
	jumping = true
	jumpTimer = 0.0
	desiredHeight = jumpHeight
	pass
	
func updateAnimation():
	var animator = get_child(0)
		
	if(!moving && grounded):
		animator.play("Idle")
	
	if(moving && grounded):
		animator.play("Walk")
		
	if(jumping):
		animator.play("Jump")
	
	pass

func applyJump(delta):
	jumpTimer += delta;
	var jumpVel = -((2*desiredHeight)/(jumpDuration * jumpDuration)) * (jumpTimer - jumpDuration);
	if jumpTimer >= jumpDuration:
		jumping = false
	return Vector2(0,-jumpVel)
	
	
func applyMove():
	return Vector2(xInput, 0) * speed
	
	
func applyGravity():
	if jumping:
		return Vector2(0,0)
	return Vector2(0, 200)
	

func _physics_process(delta):
	velocity = applyJump(delta) + applyGravity() + applyMove()
	move_and_slide(velocity)
	grounded = 	is_on_wall()
	moving = false
	pass
