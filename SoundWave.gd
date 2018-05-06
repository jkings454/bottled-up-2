extends RayCast2D


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _physics_process(delta):
	if get_parent().visible == true:
    	var space_rid = get_world_2d().space
    	var space_state = Physics2DServer.space_get_direct_state(space_rid)
