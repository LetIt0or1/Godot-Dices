package com.godot.game.activity

import AppTheme
import android.os.Bundle
import androidx.compose.animation.core.Animatable
import androidx.compose.animation.core.tween
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.platform.ComposeView
import androidx.compose.ui.unit.dp
import com.godot.game.R
import com.godot.game.compose.DicesInCompose
import com.godot.game.plugins.AddADiceGodotPlugin
import com.godot.game.plugins.RemoveDiceGodotPlugin
import com.godot.game.plugins.ThrowDiceGodotPlugin
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import org.godotengine.godot.GodotActivity

class GodotMainActivity : GodotActivity() {
    public override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setTheme(R.style.GodotAppMainTheme)
        setContentView(R.layout.main_activity)
        initGodotInstance()

        findViewById<ComposeView>(R.id.composeView).setContent {
            AppTheme {
                Box(
                    modifier = Modifier.fillMaxSize(),
                    contentAlignment = Alignment.BottomCenter
                ) {
                    Row(Modifier.padding(vertical = 16.dp)) {
                        OutlinedButton(onClick = { godot?.let { RemoveDiceGodotPlugin(it).triggerRemoveDice() } }) {
                            Text("Too many dices imo")
                        }

                        InteractiveDicesCompose()

                        OutlinedButton(onClick = { godot?.let { AddADiceGodotPlugin(it).triggerAddDice() } }) {
                            Text("I NEED MORE!")
                        }
                    }
                }
            }
        }
    }

    @Composable
    fun InteractiveDicesCompose() {
        var num1 by remember { mutableStateOf((1..6).random()) }
        var num2 by remember { mutableStateOf((1..6).random()) }
        val rotation = remember { Animatable(0f) } // Remember the rotation state
        val coco = rememberCoroutineScope()
        Box(
            Modifier
                .graphicsLayer {
                    rotationZ = rotation.value
                }
                .clickable {
                    // Launch coroutine for dice roll and rotation animation
                    coco.launch {
                        // Animate rotation to 180 degrees
                        rotation.animateTo(
                            targetValue = rotation.targetValue + 180,
                            animationSpec = tween(durationMillis = 500)
                        )
                        rotation.snapTo(0f) // Reset rotation after animation

                        // Change numbers on the dices three times
                        repeat(5) {
                            num1 = (1..6).random()
                            num2 = (1..6).random()
                            delay(100) // Delay to visualize number change
                        }
                    }
                }
        ) {
            DicesInCompose(num1 = num1, num2 = num2)
        }
    }

    private fun diceIt() {
        godot?.let {
            ThrowDiceGodotPlugin(it).triggerThrowDice()
        }
    }

}
