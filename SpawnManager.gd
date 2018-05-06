extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (float)var spawnRate = 7.0
var spawnTimer = 0.0

var spawnPoints = []

func _ready():
	spawnPoints = get_children()
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	spawnTimer += delta;
	if spawnTimer >= spawnRate:
		spawnTimer = 0.0
		spawn()
	pass
	
func spawn():
	var rand = rand_range(0, spawnPoints.size() - 1)
	var enemy = preload("res://EnemyBottle.tscn").instance()
	spawnPoints[rand].add_child(enemy)
	pass
