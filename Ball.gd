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
# some of these mins could maybe be set in funtions? like do we want x to always be set be swing timing? idk ugly for now but works i guess
	if bat_outside == 1:
		if swing_early == 1:
			axis_lock_linear_y = false
			var min_x = -300
			var max_x = -100
			var min_y = 5
			var max_y = 20
			var min_z = -150
			var max_z = -100
			var impulse = Vector3(
			randf_range(min_x, max_x),
			randf_range(min_y, max_y),
			randf_range(min_z, max_z))
			apply_impulse(impulse)
			print("outside bat and early")
			sleeping = true
			
		elif swing_perfect == 1:
			axis_lock_linear_y = false
			var min_x = 50
			var max_x = 200
			var min_y = 10
			var max_y = 25
			var min_z = -200
			var max_z = -150
			var impulse = Vector3(
			randf_range(min_x, max_x),
			randf_range(min_y, max_y),
			randf_range(min_z, max_z))
			apply_impulse(impulse)
			print("outside bat and perfect")
			sleeping = true
			
		elif swing_late == 1:
			axis_lock_linear_y = false
			var min_x = 50
			var max_x = 200
			var min_y = 10
			var max_y = 25
			var min_z = -150
			var max_z = -100
			var impulse = Vector3(
			randf_range(min_x, max_x),
			randf_range(min_y, max_y),
			randf_range(min_z, max_z))
			apply_impulse(impulse)
			print("outside bat and late")
			sleeping = true
	
	elif bat_perfect == 1:
		if swing_early == 1:
			axis_lock_linear_y = false
			var min_x = -250
			var max_x = -50
			var min_y = 15
			var max_y = 25
			var min_z = -150
			var max_z = -200
			var impulse = Vector3(
			randf_range(min_x, max_x),
			randf_range(min_y, max_y),
			randf_range(min_z, max_z))
			apply_impulse(impulse)
			print("perfect bat and early")
			sleeping = true
		elif swing_perfect == 1:
			axis_lock_linear_y = false
			var min_x = 0
			var max_x = 0
			var min_y = 30
			var max_y = 35
			var min_z = -400
			var max_z = -450
			var impulse = Vector3(
			randf_range(min_x, max_x),
			randf_range(min_y, max_y),
			randf_range(min_z, max_z))
			apply_impulse(impulse)
			print("perfect and perfect")
			sleeping = true
			
		elif swing_late == 1:
			var min_x = 100
			var max_x = 200
			var min_y = 5
			var max_y = 15
			var min_z = -100
			var max_z = -200
			var impulse = Vector3(
			randf_range(min_x, max_x),
			randf_range(min_y, max_y),
			randf_range(min_z, max_z))
			apply_impulse(impulse)
			apply_impulse(Vector3(0, 20, -200))
			print("perfect bat and late")
			sleeping = true
		
	elif bat_inside == 1:
		if swing_early == 1:
			axis_lock_linear_y = false
			var min_x = -200
			var max_x = -100
			var min_y = 10
			var max_y = 15
			var min_z = -20
			var max_z = -50
			var impulse = Vector3(
			randf_range(min_x, max_x),
			randf_range(min_y, max_y),
			randf_range(min_z, max_z))
			apply_impulse(impulse)
			print("inside bat and early")
			sleeping = true
		elif swing_perfect == 1:
			axis_lock_linear_y = false
			var min_x = -200
			var max_x = -100
			var min_y = 10
			var max_y = 15
			var min_z = -75
			var max_z = -90
			var impulse = Vector3(
			randf_range(min_x, max_x),
			randf_range(min_y, max_y),
			randf_range(min_z, max_z))
			apply_impulse(impulse)
			print("inside and perfect")
			sleeping = true
		elif swing_late == 1:
			axis_lock_linear_y = false
			var min_x = -200
			var max_x = -100
			var min_y = 10
			var max_y = 15
			var min_z = -50
			var max_z = -60
			var impulse = Vector3(
			randf_range(min_x, max_x),
			randf_range(min_y, max_y),
			randf_range(min_z, max_z))
			apply_impulse(impulse)
			print("inside bat and late")
			sleeping = true
	if Input.is_action_just_pressed("right_click"):
		_reset()




func _reset():
	sleeping = true
	position = Vector3(0, 1.3, -15)
	#position = Vector3(0, 1, -3)
	#linear_velocity = Vector3(0,0,0)
	axis_lock_linear_y = true
	sleeping = false
	
	$PitchClock.start()


func throw_pitch():
	#pass
	apply_impulse(Vector3(0, 0, 25))



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


func _on_early_body_entered(_body):
	swing_early = 1 


func _on_early_body_exited(_body):
	swing_early = 0

func _on_late_body_entered(_body):
	swing_late = 1

func _on_late_body_exited(_body):
	swing_late = 0

func _on_perfect_zone_body_entered(_body):
	swing_perfect = 1


func _on_perfect_zone_body_exited(_body):
	swing_perfect = 0

func _on_pitch_clock_timeout():
	pass # Replace with function body.


func _on_area_3d_body_entered(_body):
	print("homerun!")
	_reset()
