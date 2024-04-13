extends DirectionalLight3D


var originalRotation: Vector3 = Vector3.ZERO
var originalPosition: Vector3 = Vector3.ZERO
func _ready():
	originalRotation = rotation
	originalPosition = position
	

func _physics_process(delta):
	var accelerometer_value = Input.get_accelerometer()

	# Normalize the accelerometer values to a range that suits the light rotation
	# Assuming the values are in the range [-1, 1]
	# You need to adjust these mappings based on how you want the accelerometer data to rotate the light
	#var x_rotation = lerp(-90, -10, -accelerometer_value.z)  # Assuming phone vertical is z = -1
	#var y_rotation = lerp(0, -90, accelerometer_value.x)  # Assuming rotating phone on y-axis maps to x accelerometer
	#var z_rotation = 0  # Assuming no need to adjust z based on accelerometer

	# Update the light's rotation
	#rotation = accelerometer_value.normalized() + originalRotation
