extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	Input.action_press("ui_accept")
	print("_on_button_pressed")


func _on_button_button_up():
	Input.action_release("ui_accept")
	print("_on_button_button_up")
