extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (float) var frequency = 30
export (float) var hitRange = 500
export (float) var waveSpeed = 5
var waveObject
var step = 0.0
 
func _ready():
	waveObject = get_child(1).get_child(0)
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	
	var mousePos = get_viewport().get_mouse_position()
	look_at(mousePos)
 	
	var waveObject = get_child(1).get_child(0)
	shoot(Input.is_action_pressed("fire"), delta)
	
	pass
	
func shoot(isPressed, delta):
	
	waveObject.visible = false
	step += delta * waveSpeed
	
	if step > 1.0:
		step = 0.0
	
	calculateFrequency()
	
	if(isPressed):
		waveObject.visible = true
		
	waveObject.material.set("shader_param/uvOffset", Vector2(step, 0.0))
	waveObject.material.set("shader_param/uvScale", Vector2(frequency, 1.0))
	
	pass
 	
func calculateFrequency():
	if Input.is_action_pressed("frequency_increase"):
		frequency += 1;
	if Input.is_action_pressed("frequency_decrease"):
		frequency -= 1;
	frequency = clamp(frequency, 20.0, 50.0)
	pass
