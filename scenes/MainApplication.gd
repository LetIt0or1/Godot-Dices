extends Node3D

var dice_resource = load("res://presets/dice.tscn")
var dices = []  # Array to keep track of the dice instances

func _ready():
	_add_dice()
		
func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
		_remove_dice()
		print("remove a dice")
	elif Input.is_action_just_pressed("ui_right"):
		_add_dice()
		print("add a dice")

func _add_dice():
	var dice_instance = dice_resource.instantiate()
	dice_instance.position = Vector3(0,5,0)
	add_child(dice_instance)
	dices.append(dice_instance)  # Keep track of the new dice instance
	
func _remove_dice():
	print("dices.size():",dices.size())
	if dices.size() > 0:
		var dice_to_remove = dices.pop_back()  # Remove the last dice from the array
		dice_to_remove.queue_free()  # Queue the dice for deletion
		#dice_to_remove.delete()
