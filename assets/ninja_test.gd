extends KinematicBody

var MOUSE_SENSITIVITY = 0.05

# How fast the player moves in meters per second.
export var speed := 7.0
export var jump_strength := 20.0
export var gravity := 50.0

var _velocity := Vector3.ZERO
var _snap_vector := Vector3.DOWN

onready var spring_arm: SpringArm = $CameraNod
onready var mesh: MeshInstance = $BodyMesh
# The downward acceleration when in the air, in meters per second squared.
export var fall_acceleration = 75

var velocity = Vector3.ZERO

var label


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	spring_arm.translation = translation
	pass

func _physics_process(delta):
	var movement = Vector3.ZERO
	
	movement.z =  int(Input.is_action_pressed("move_back")) - int(Input.is_action_pressed("move_forward"))
	movement.x =  int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	movement = movement.rotated(Vector3.UP, spring_arm.rotation.y).normalized
	
	_velocity.x = movement.x * speed
	_velocity.z = movement.y * speed
	_velocity.y -= gravity * delta
	
	var just_landed := is_on_floor() and _snap_vector == Vector3.ZERO
	var is_jumping := is_on_floor() and Input.is_action_just_pressed("jump")
	if is_jumping:
		_velocity.y = jump_strength
		_snap_vector = Vector3.ZERO
	elif just_landed:
		_snap_vector = Vector3.DOWN
	_velocity = move_and_slide_with_snap(_velocity, _snap_vector, Vector3.UP, true)
	pass

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_cam(event)

func rotate_cam(event):
  rotate_y(deg2rad(event.relative.x * MOUSE_SENSITIVITY * -1))
