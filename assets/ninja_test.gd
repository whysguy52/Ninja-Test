extends KinematicBody

var MOUSE_SENSITIVITY = 0.05
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		move_and_slide(-transform.basis.z*5, Vector3(0,0,1))
	elif Input.is_action_pressed("ui_down"):
		move_and_slide(transform.basis.z*5, Vector3(0,0,-1))
	pass

func _input(event):
#    if event.is_action_pressed("LMB"):
#        print_debug("EVENT")
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_cam(event)

func rotate_cam(event):
  rotate_y(deg2rad(event.relative.x * MOUSE_SENSITIVITY * -1))
