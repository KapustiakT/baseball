extends RigidBody3D

var bat_zone = 'out'
var bat_outside = 0
var bat_perfect = 0
var bat_inside = 0
var swing_early = 0
var swing_late = 0
var swing_perfect = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	apply_impulse(Vector3(0, 0, 30))
	axis_lock_linear_y = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
#for testing is checked perfect is always checked second in full it should be checked last.
#zones need to be big enough ball could ONLY be in perfect perfect for now zones are to small / ball to big
	if Input.is_action_just_pressed("left_click"):
		if bat_outside == 1:
			if swing_early == 1:
				axis_lock_linear_y = false
				apply_impulse(Vector3(100, 20, -200))
				print("outside bat and early")
			elif swing_perfect == 1:
				axis_lock_linear_y = false
				apply_impulse(Vector3(100, 20, -200))
				print("outside bat and perfect")
			elif swing_late == 1:
				axis_lock_linear_y = false
				apply_impulse(Vector3(100, 20, -200))
				print("outside bat and late")
			
		
		elif bat_perfect == 1:
			if swing_early == 1:
				axis_lock_linear_y = false
				apply_impulse(Vector3(0, 20, -200))
				print("perfect bat and early")
			elif swing_perfect == 1:
				axis_lock_linear_y = false
				apply_impulse(Vector3(0, 20, -200))
				print("perfect and perfect")
			elif swing_late == 1:
				axis_lock_linear_y = false
				apply_impulse(Vector3(0, 20, -200))
				print("perfect bat and late")
			
		elif bat_inside == 1:
			if swing_early == 1:
				axis_lock_linear_y = false
				apply_impulse(Vector3(-100, 20, -200))
				print("inside bat and early")
			elif swing_perfect == 1:
				axis_lock_linear_y = false
				apply_impulse(Vector3(-100, 20, -200))
				print("inside and perfect")
			elif swing_late == 1:
				axis_lock_linear_y = false
				apply_impulse(Vector3(-100, 20, -200))
				print("inside bat and late")
	
	if Input.is_action_just_pressed("right_click"):
		_reset()


func _reset():
	sleeping = true
	position = Vector3(0, 2, -9.5)
	linear_velocity = Vector3(0,0,0)
	axis_lock_linear_y = true
	sleeping = false
	
	$PitchClock.start()


func throw_pitch():
	apply_impulse(Vector3(0, 0, 30))



func _on_bat_body_exited(_body):
	bat_zone = 'out'
	


func _on_outside_body_entered(_body):
	bat_outside = 1


func _on_perfect_body_entered(_body):
	bat_perfect = 1


func _on_inside_body_entered(_body):
	bat_inside = 1





func _on_bat_body_entered(_body):
	bat_zone = 'in'


func _on_outside_body_exited(_body):
	bat_outside = 0


func _on_perfect_body_exited(_body):
	bat_perfect = 0


func _on_inside_body_exited(_body):
	bat_inside = 0


func _on_early_body_entered(body):
	swing_early = 1 


func _on_early_body_exited(body):
	swing_early = 0

func _on_late_body_entered(body):
	swing_late = 1

func _on_late_body_exited(body):
	swing_late = 0

func _on_perfect_zone_body_entered(body):
	swing_perfect = 1


func _on_perfect_zone_body_exited(body):
	swing_perfect = 0

func _on_pitch_clock_timeout():
	pass # Replace with function body.





