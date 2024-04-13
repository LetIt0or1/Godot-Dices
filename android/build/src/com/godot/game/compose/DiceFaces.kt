package com.godot.game.compose

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp

val DiceSize = 50.dp

@Composable
fun Dice(number: Int) {
    listOf<@Composable () -> Unit>(
        { Dice1() },
        { Dice2() },
        { Dice3() },
        { Dice4() },
        { Dice5() },
        { Dice6() },
    ).get(number)()
}

@Composable
private fun Dice1(
    modifier: Modifier = Modifier,
    color: Color = MaterialTheme.colorScheme.background
) {
    Box(
        modifier
            .size(DiceSize)
            .border(
                color = color,
                shape = RoundedCornerShape(5.dp),
                width = 1.dp
            )
    ) {
        DiceNumberCircle(Modifier.offset(20.dp, 20.dp))
    }
}

@Composable
private fun Dice2(
    modifier: Modifier = Modifier,
    color: Color = MaterialTheme.colorScheme.background
) {
    Box(
        modifier
            .size(DiceSize)
            .border(
                color = color,
                shape = RoundedCornerShape(5.dp),
                width = 1.dp
            )
    ) {
        DiceNumberCircle(Modifier.offset(5.dp, 5.dp))
        DiceNumberCircle(Modifier.offset(35.dp, 35.dp))
    }
}

@Composable
private fun Dice3(
    modifier: Modifier = Modifier,
    color: Color = MaterialTheme.colorScheme.background
) {
    Box(
        modifier
            .size(DiceSize)
            .border(
                color = color,
                shape = RoundedCornerShape(5.dp),
                width = 1.dp
            )
    ) {
        DiceNumberCircle(Modifier.offset(20.dp, 20.dp))
        DiceNumberCircle(Modifier.offset(5.dp, 5.dp))
        DiceNumberCircle(Modifier.offset(35.dp, 35.dp))
    }
}

@Composable
private fun Dice4(
    modifier: Modifier = Modifier,
    color: Color = MaterialTheme.colorScheme.background
) {
    Box(
        modifier
            .size(DiceSize)
            .border(
                color = color,
                shape = RoundedCornerShape(5.dp),
                width = 1.dp
            )
    ) {
        DiceNumberCircle(Modifier.offset(5.dp, 5.dp))
        DiceNumberCircle(Modifier.offset(5.dp, 35.dp))
        DiceNumberCircle(Modifier.offset(35.dp, 5.dp))
        DiceNumberCircle(Modifier.offset(35.dp, 35.dp))
    }
}

@Composable
private fun Dice5(
    modifier: Modifier = Modifier,
    color: Color = MaterialTheme.colorScheme.background
) {
    Box(
        modifier
            .size(DiceSize)
            .border(
                color = color,
                shape = RoundedCornerShape(5.dp),
                width = 1.dp
            )
    ) {
        DiceNumberCircle(Modifier.offset(5.dp, 5.dp))
        DiceNumberCircle(Modifier.offset(5.dp, 35.dp))
        DiceNumberCircle(Modifier.offset(20.dp, 20.dp))
        DiceNumberCircle(Modifier.offset(35.dp, 5.dp))
        DiceNumberCircle(Modifier.offset(35.dp, 35.dp))
    }
}

@Composable
private fun Dice6(
    modifier: Modifier = Modifier,
    color: Color = MaterialTheme.colorScheme.background
) {
    Box(
        modifier
            .size(DiceSize)
            .border(
                color = color,
                shape = RoundedCornerShape(5.dp),
                width = 1.dp
            )
    ) {
        DiceNumberCircle(Modifier.offset(5.dp, 5.dp))
        DiceNumberCircle(Modifier.offset(5.dp, 20.dp))
        DiceNumberCircle(Modifier.offset(5.dp, 35.dp))
        DiceNumberCircle(Modifier.offset(35.dp, 5.dp))
        DiceNumberCircle(Modifier.offset(35.dp, 20.dp))
        DiceNumberCircle(Modifier.offset(35.dp, 35.dp))
    }
}

@Composable
private fun DiceNumberCircle(modifier: Modifier = Modifier) {
    Box(
        modifier
            .size(10.dp)
            .background(color = Color.White, shape = CircleShape)
    )
}
