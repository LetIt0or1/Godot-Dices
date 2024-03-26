extends Node3D

# Variables to control the force range
var min_force = Vector3(-10, -10, -10)
var max_force = Vector3(10, 10, 10)

# Assuming the RigidBody3D is the first child, or adjust the index accordingly
var rigid_body: RigidBody3D

func _ready():
	# Initialize the RigidBody3D reference
	rigid_body = get_child(0) as RigidBody3D
	if not rigid_body:
		print("RigidBody3D not found as a child. Please check the node hierarchy.")
		return

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		applyRandomForce()
		print(rigid_body.position)


func applyRandomForce():
	# This function is called every time the timer times out (every 5 seconds in this case)
	# Generating a random force vector
	var random_force = Vector3(
		randf_range(min_force.x, max_force.x),
		randf_range(min_force.y, max_force.y),
		randf_range(min_force.z, max_force.z)
	)

	# Applying the random force to the RigidBody3D
	if rigid_body:
		rigid_body.apply_impulse(Vector3.UP, random_force)
