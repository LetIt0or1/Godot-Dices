extends DirectionalLight3D
 
#func _ready():
	# Make sure the gyroscope is available and enabled
	#if Input.is_sensor_enabled(Input.SENSOR_GYROSCOPE):
		#Input.set_sensor_enabled(Input.SENSOR_GYROSCOPE, true)
	#else:
		#print("Gyroscope is not available on this device.")

func _process(delta):
	# Assuming we can use the gyroscope data directly to set the light's orientation
	if Input.is_sensor_enabled(Input.SENSOR_GYROSCOPE):
		var gyro_data = Input.get_gravity()  # Or Input.get_gyroscope() depending on your need
		# Convert gyroscope data to a suitable rotation format and apply it to the light
		# The conversion will depend on how you want the gyroscope data to affect the light
		var rotation_degrees = Vector3(rad2deg(asin(gyro_data.x)), rad2deg(asin(gyro_data.y)), rad2deg(asin(gyro_data.z)))
		self.transform = Transform.IDENTITY.rotated(Vector3(1, 0, 0), deg2rad(rotation_degrees.x)).rotated(Vector3(0, 1, 0), deg2rad(rotation_degrees.y))
