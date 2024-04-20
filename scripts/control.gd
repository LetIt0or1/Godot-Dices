extends Control

func _on_touch_button_remove_dice_pressed():
	get_child(1).get_child(0).get_child(0).play("remove_dice_animation")


func _on_touch_button_add_dice_pressed():
	get_child(1).get_child(1).get_child(0).play("add_dice_animation")
