extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("swing"):
		play("mixamo_com")
	if Input.is_action_pressed("right_click"):
		stop() # Stop the animation if it's playing
