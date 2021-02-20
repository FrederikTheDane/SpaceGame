extends Spatial

export (NodePath) var camera_path;
export (NodePath) var light_path;
var skybox_camera: Camera
var target_camera: Camera
var default_transform: Transform
var prev_transform: Transform
var sun: Spatial
var light: Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
	skybox_camera = get_node("SkyboxCam")
	sun = get_node("Sun")
	target_camera = get_node(camera_path)
	light = get_node(light_path)
	default_transform = skybox_camera.transform
	prev_transform = default_transform
	light.look_at_from_position(sun.translation, Vector3(0,0,0), Vector3(0,1,0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	skybox_camera.transform = target_camera.transform
