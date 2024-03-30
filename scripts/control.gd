extends Control

# Main button which forces dices to rotate 
func _on_jump_button_pressed():
	Input.action_press("ui_accept")
	Input.action_release("ui_accept")
	print("_on_button_pressed")

func _on_remove_dice_button_pressed():
	Input.action_press("ui_left")
	Input.action_release("ui_left")
	print("_on_remove_dice_button_pressed")

func _on_add_dice_button_pressed():
	Input.action_press("ui_right")
	Input.action_release("ui_right")
	print("_on_add_dice_button_pressed")
