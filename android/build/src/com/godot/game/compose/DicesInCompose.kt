package com.godot.game.compose

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.size
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
@Preview
fun DicesInCompose(num1: Int = 3, num2: Int = 6) {
    Box(Modifier.size(95.dp)) {
        Dice(num1)
        Dice(num2)
    }
}

@Composable
@Preview
private fun DicesInComposePreview() {
    Column {
        repeat(6) {
            Dice(it + 1)
        }
    }
}
