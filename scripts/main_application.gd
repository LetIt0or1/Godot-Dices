extends Node3D

var dice_resources = [
	preload("res://presets/dice/dice1.tscn"),
	preload("res://presets/dice/dice2.tscn"),
	preload("res://presets/dice/dice3.tscn"),
	preload("res://presets/dice/dice4.tscn"),
]
var dices = []  # Array to keep track of the dice instances

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
		_remove_dice()
		print("remove a dice")
	elif Input.is_action_just_pressed("ui_right"):
		_add_dice()
		print("add a dice")

func _attach_to_scene(node:Node3D):
	dices.append(node)

func _add_dice():
	var dice_instance = dice_resources[randi() % dice_resources.size()].instantiate()
	dice_instance.position = Vector3(0,5,0)
	dice_instance.on_start = false
	add_child(dice_instance)
	_attach_to_scene(dice_instance)
	
func _remove_dice():
	print("dices.size():",dices.size())
	if dices.size() > 0:
		var dice_to_remove = dices.pop_back()  # Remove the last dice from the array
		dice_to_remove.reset()
		#dice_to_remove.queue_free()  # Queue the dice for deletion
