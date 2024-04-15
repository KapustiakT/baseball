extends RigidBody3D

var zone = 'out'

# Called when the node enters the scene tree for the first time.
func _ready():
	apply_impulse(Vector3(0, 0, 30))
	axis_lock_linear_y = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input = Vector3.ZERO
	input.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input.z = Input.get_action_strength("move_back") -  Input.get_action_strength("move_foward")
	
	apply_central_force(input * 1200.0 * delta)
	
	if Input.is_action_just_pressed("left_click") and zone == 'in':
		axis_lock_linear_y = false
		apply_impulse(Vector3(0, 20, -100))
		
	_reset()


func _reset():
	if Input.is_action_just_pressed("right_click"):
		axis_lock_linear_y = true
		position = Vector3(0, 2, -9.5)
		apply_impulse(Vector3(0, 0, 30))


func _on_bat_body_entered(body):
	print('enter')
	zone = 'in'
	print(zone) 


func _on_bat_body_exited(body):
	print('exited')
	zone = 'out'
	print(zone)
	
