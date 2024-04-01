extends Node3D
# Assuming the RigidBody3D is the first child, or adjust the index accordingly
var rigid_body: RigidBody3D

func _ready():
	# Initialize the RigidBody3D reference
	rigid_body = get_child(0) as RigidBody3D
	if not rigid_body:
		print("RigidBody3D not found as a child. Please check the node hierarchy.")
		return
	else:
		var keep_in_view_script = preload( "res://scripts/keep_in_view.gd" )
		rigid_body.set_script(keep_in_view_script)
		applyRandomForce()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		applyRandomForce()
		print(rigid_body.position)

# Assuming min_force and max_force are defined somewhere in the script as the minimum
# and maximum values for the force vector components
var min_force = Vector3(-10, -10, -10)
var max_force = Vector3(10, 10, 10)

# Assuming min_torque and max_torque are defined as the minimum
# and maximum values for the torque vector components
var min_torque = Vector3(-10, -10, -10)
var max_torque = Vector3(10, 10, 10)

func applyRandomForce():
	# Generate a random force vector
	var random_force = Vector3(
		randf_range(min_force.x, max_force.x),
		randf_range(min_force.y, max_force.y),
		randf_range(min_force.z, max_force.z)
	)

	# Generate a random torque vector
	var random_torque = Vector3(
		randf_range(min_torque.x, max_torque.x),
		randf_range(min_torque.y, max_torque.y),
		randf_range(min_torque.z, max_torque.z)
	)

	# Applying the random force and torque to the RigidBody3D
	if rigid_body:
		rigid_body.apply_impulse(Vector3.UP, random_force) # Apply force at an offset from center of mass
		rigid_body.apply_torque(random_torque) # Apply torque

	print("Apply random force and torque to the dice")
