package com.godot.game.plugins

import org.godotengine.godot.Godot
import org.godotengine.godot.plugin.GodotPlugin

class RemoveDiceGodotPlugin(godot: Godot) : GodotPlugin(godot) {

    fun triggerRemoveDice() {
        emitSignal("remove_dice")
    }

    override fun getPluginName() = "dice_control_remove"

}

class ThrowDiceGodotPlugin(godot: Godot) : GodotPlugin(godot) {

    fun triggerThrowDice() {
        emitSignal("throw_dice")
    }

    override fun getPluginName() = "dice_control_throw"

}

class AddADiceGodotPlugin(godot: Godot) : GodotPlugin(godot) {

    fun triggerAddDice() {
        emitSignal("add_dice")
    }

    override fun getPluginName() = "dice_control_add"

}
