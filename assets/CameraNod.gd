extends Spatial

var MOUSE_SENSITIVITY = 0.05

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
#    if event.is_action_pressed("LMB"):
#        print_debug("EVENT")
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_cam(event)

func rotate_cam(event):
  rotate_x(deg2rad(event.relative.y * MOUSE_SENSITIVITY * -1))
