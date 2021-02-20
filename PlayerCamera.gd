extends Camera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var camera_sensitivity: float = 0.001
var rot: Vector2 = Vector2(0, 0)
var parent: Spatial


# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _unhandled_input(event: InputEvent):
	if event is InputEventMouseMotion:
		rot -= event.relative * camera_sensitivity
		transform.basis = Basis()
		rotate_object_local(Vector3(0, 1, 0), rot.x) # first rotate in Y
		rotate_object_local(Vector3(1, 0, 0), rot.y) # then rotate in X
	
