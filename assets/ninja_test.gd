extends KinematicBody

var MOUSE_SENSITIVITY = 0.05

# How fast the player moves in meters per second.
export var speed = 5
# The downward acceleration when in the air, in meters per second squared.
export var fall_acceleration = 75

var velocity = Vector3.ZERO

var label


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var movement = Vector3.ZERO
	
	movement.z =  int(Input.is_action_pressed("move_back")) - int(Input.is_action_pressed("move_forward"))
	movement.x =  int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	movement = movement.rotated(Vector3.UP, rotation.y).normalized() * speed
	move_and_slide(movement)
	pass

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_cam(event)

func rotate_cam(event):
  rotate_y(deg2rad(event.relative.x * MOUSE_SENSITIVITY * -1))
