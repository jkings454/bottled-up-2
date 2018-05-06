extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var spawnPoints = []
const enemyBottle = preload("res://bottle.tscn")

func _ready():
	spawnPoints = get_children()
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
	
func spawn():
	int rand = rand_range(0, spawnPoints.count)
	var enemy = get_node("Node2D").add_child(enemyBottle)
	enemy.set_pos(spawnPoints[rand])
	pass
