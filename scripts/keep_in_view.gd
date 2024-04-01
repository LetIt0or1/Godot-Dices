extends RigidBody3D

var camera: Camera3D

func _ready():
	print("hell world!")
	camera = get_node("Camera3D") as Camera3D  # Update the path to your Camera3D node


func _process(delta):
	if camera == null:
		print("NO")
	if is_object_in_view():
		print("Object is in view")
	else:
		print("Object left the view")

func is_object_in_view() -> bool:
	var screen_pos = camera.unproject_position(global_transform.origin)

	# Check if the screen_pos is within the viewport's boundaries
	return screen_pos.x >= 0 and screen_pos.x <= camera.get_viewport_rect().size.x and screen_pos.y >= 0 and screen_pos.y <= camera.get_viewport_rect().size.y and screen_pos.z > 0  # Ensure the object is in front of the camera
