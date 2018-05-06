extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (float) var frequency = 100
var step = 0.0;

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	var mousePos = get_viewport().get_mouse_position()
	look_at(mousePos)
	
	var waveObject = get_child(1).get_child(0)
	step += delta;
	waveObject.set_point_position(1, get_child(1).to_local(mousePos))
	
	pass
