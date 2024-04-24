extends Skeleton3D
var speed = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_right"):
		 # Move left
		translate(Vector3(-speed * delta, 0, 0))
	elif Input.is_action_pressed("move_left"):
		# Move right
		translate(Vector3(speed * delta, 0, 0))
