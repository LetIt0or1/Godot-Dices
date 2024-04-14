extends Node3D

signal remove_dice
signal add_dice

var dice_resources = [
	preload("res://presets/dice/dice1.tscn"),
	preload("res://presets/dice/dice2.tscn"),
	preload("res://presets/dice/dice3.tscn"),
	preload("res://presets/dice/dice4.tscn"),
]
var dices = []  # Array to keep track of the dice instances

func _ready():
	connect("remove_dice", _remove_dice)
	connect("add_dice", _remove_dice)
	_add_dice()

func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
		_remove_dice()
		print("remove a dice")
	elif Input.is_action_just_pressed("ui_right"):
		_add_dice()
		print("add a dice")

func _add_dice():
	var dice_instance = dice_resources[randi() % dice_resources.size()].instantiate()
	dice_instance.position = Vector3(0,5,0)
	add_child(dice_instance)
	dices.append(dice_instance)  # Keep track of the new dice instance
	
func _remove_dice():
	print("dices.size():",dices.size())
	if dices.size() > 0:
		var dice_to_remove = dices.pop_back()  # Remove the last dice from the array
		dice_to_remove.queue_free()  # Queue the dice for deletion









## Interface used to access the functionality provided by this plugin

var _plugin_name = "dice_control"
var _plugin_singleton

func _init():
	if Engine.has_singleton(_plugin_name):
		_plugin_singleton = Engine.get_singleton(_plugin_name)
	else:
		printerr("Initialization error: unable to access the java logic")

## Print a 'Hello World' message to the logcat.
func helloWorld():
	if _plugin_singleton:
		_plugin_singleton.helloWorld()
	else:
		printerr("Initialization error")
		
