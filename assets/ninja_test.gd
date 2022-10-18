extends KinematicBody

var MOUSE_SENSITIVITY = 0.05

# How fast the player moves in meters per second.
export var speed = 14
# The downward acceleration when in the air, in meters per second squared.
export var fall_acceleration = 75

var velocity = Vector3.ZERO

var label


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	print_debug(global_transform.basis.z)
	pass

func _physics_process(delta):
	var movement = Vector3.ZERO
	
	movement.z = int(Input.is_action_pressed("move_forward")) - int(Input.is_action_pressed("move_back"))
	movement.x = int(Input.is_action_pressed("move_left")) - int(Input.is_action_pressed("move_right"))
	
#	if Input.is_action_pressed("move_forward"):
#		movement += Vector3(0,0,1)
##		move_and_slide(-transform.basis.z*5)
#	if Input.is_action_pressed("move_back"):
#		movement += Vector3(0,0,-1)
##		move_and_slide(transform.basis.z*5)
#	if Input.is_action_pressed("move_left"):
#		movement += Vector3(-1,0,0)
#	if Input.is_action_pressed("move_right"):
#		movement += Vector3(1,0,0)
		
	move_and_slide(movement)
		
	pass

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_cam(event)

func rotate_cam(event):
  rotate_y(deg2rad(event.relative.x * MOUSE_SENSITIVITY * -1))
