extends Node3D

@export var on_start = true
var start_position: Vector3
var rigid_body: RigidBody3D
var clickable_area : Area3D

var min_force = Vector3(-7, -7, -7)
var max_force = Vector3(7, 7, 7)

var min_torque = Vector3(-1, -1, -1)
var max_torque = Vector3(1, 1, 1)

func _ready():
	rigid_body = get_child(0) as RigidBody3D
	clickable_area = get_child(0).get_child(0) as Area3D
	start_position = rigid_body.position
	
	clickable_area.connect("input_event", _on_area_3d_input_event)
	
	if not rigid_body:
		print("RigidBody3D not found as a child. Please check the node hierarchy.")
		return
	else:
		var keep_in_view_script = preload( "res://scripts/keep_in_view.gd" )
		rigid_body.set_script(keep_in_view_script)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		applyRandomForce()
		print(rigid_body.position)

func applyRandomForce():
	if on_start: return
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

func engage():
	start_position = rigid_body.position
	var current_scene = get_tree().current_scene
	current_scene._attach_to_scene(self)
	if on_start:
		rigid_body.apply_impulse(Vector3.UP, Vector3(10,0,0)) # Apply force at an offset from center of mass
		rigid_body.apply_torque(Vector3.UP/4) # Apply torque
		on_start = false

func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if  event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		engage()

func reset():
	on_start = true
	rigid_body.position = start_position 
	rigid_body.rotation_degrees = Vector3.ZERO
	rigid_body.linear_velocity = Vector3.ZERO
	rigid_body.angular_velocity = Vector3.ZERO
