extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

enum EnemyState {IDLE, CHASE, ATTACK, DIE}
var state
export (int)var maxHealth = 100
export (int)var moveSpeed = 5
var currentHealth = 100
var player

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	currentHealth = maxHealth
	player = get_parent().get_child(0)
	state = EnemyState.CHASE
	pass
	
func _process(delta):
	updateAnimation()
	pass
	
func updateAnimation():
	
	pass

func _physics_process(delta):
	match state:
		CHASE:
			moveToPlayer()
	pass

func attack():
	pass
	
func moveToPlayer():
	var playerPos = player.global_position
	var currentPos = global_position
	var direction = (playerPos - currentPos).normalized() * moveSpeed
	
	apply_impulse(global_position, direction)
	
	pass

func damage(amount):
	currentHealth -= amount
	if currentHealth <= 0:
		state = EnemyState.DIE
		get_parent().remove_child(self)
	pass
