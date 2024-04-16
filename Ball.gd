extends RigidBody3D

var bat_zone = 'out'
var bat_outside = 0
var bat_perfect = 0
var bat_inside = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	apply_impulse(Vector3(0, 0, 30))
	axis_lock_linear_y = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if Input.is_action_just_pressed("left_click"):
		if bat_outside == 1:
			axis_lock_linear_y = false
			apply_impulse(Vector3(100, 20, -200))
		
		elif bat_perfect == 1:
			axis_lock_linear_y = false
			apply_impulse(Vector3(0, 20, -200))
		
		elif bat_inside == 1:
			axis_lock_linear_y = false
			apply_impulse(Vector3(-100, 20, -200))
		
	_reset()


func _reset():
	if Input.is_action_just_pressed("right_click"):
		axis_lock_linear_y = true
		position = Vector3(0, 2, -9.5)
		apply_impulse(Vector3(0, 0, 30))



func _on_bat_body_exited(_body):
	print('exited')
	bat_zone = 'out'
	print(bat_zone)
	


func _on_outside_body_entered(_body):
	print('outside')
	bat_outside = 1
	print(bat_outside) 


func _on_perfect_body_entered(_body):
	print('perfect')
	bat_perfect = 1
	print(bat_perfect) 


func _on_inside_body_entered(_body):
	print('inside')
	bat_inside = 1
	print(bat_inside) 





func _on_bat_body_entered(_body):
	print('in')
	bat_zone = 'in'
	print(bat_zone)


func _on_outside_body_exited(_body):
	bat_outside = 0
	print(bat_outside) 


func _on_perfect_body_exited(_body):
	bat_perfect = 0
	print(bat_perfect)


func _on_inside_body_exited(_body):
	bat_inside = 0
	print(bat_inside)
