extends SpotLight3D

var object_to_follow : RigidBody3D

var originalRotation: Vector3 = Vector3.ZERO
var originalPosition: Vector3 = Vector3.ZERO

func _ready():
	originalRotation = rotation
	originalPosition = position
	object_to_follow = get_parent().get_child(0)
	
func _process(delta):
	self.position = originalPosition + object_to_follow.position
	self.rotation = originalRotation
	
