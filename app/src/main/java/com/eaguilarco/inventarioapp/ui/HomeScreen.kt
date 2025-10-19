package com.eaguilarco.inventarioapp.ui


import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Home
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import java.text.SimpleDateFormat
import java.util.*

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun HomeScreen(onNavigateToSalidas: ()-> Unit,onNavigateToEntradas : ()-> Unit,onNavigateToProveedores: ()-> Unit) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Inicio", color = Color.Black, fontWeight = FontWeight.Bold) },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = Color.Transparent,
                )
            )
        },
        bottomBar = {
            BottomNavigationBar()
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            item { MetricCardsSection() }
            item {
                Text(
                    text = "Movimientos Recientes",
                    style = MaterialTheme.typography.titleLarge,
                    modifier = Modifier.padding(bottom = 8.dp)
                )
            }
            items(getSampleMovements()) { movement ->
                MovementItem(movement)
            }
        }
    }
}

@Composable
fun MovementItem(movement: Movement) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 8.dp),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Column(modifier = Modifier.weight(1f)) {
            Text(text = movement.description, fontWeight = FontWeight.Bold)
            Text(text = movement.time, style = MaterialTheme.typography.bodySmall, color = Color.Gray)
        }
        Text(
            text = if (movement.isIncome) "+$${movement.amount}" else "-$${movement.amount}",
            color = if (movement.isIncome) Color(0xFF4CAF50) else Color(0xFFF44336),
            fontWeight = FontWeight.Bold,
            fontSize = 16.sp
        )
    }
}

@Composable
fun BottomNavigationBar() {
    NavigationBar(containerColor = Color(0xFFF0EAF6)) {
        val selectedColor = Color(0xFF380D80)
        val unselectedColor = Color.Gray

        NavigationBarItem(
            selected = true,
            onClick = {  },
            icon = { Icon(Icons.Default.Home, contentDescription = "Inicio") },
            label = { Text("Inicio") },
            colors = NavigationBarItemDefaults.colors(
                selectedIconColor = selectedColor,
                selectedTextColor = selectedColor,
                unselectedIconColor = unselectedColor,
                unselectedTextColor = unselectedColor,
                indicatorColor = Color(0xFFD0BCFF)
            )
        )

        NavigationBarItem(
            selected = false,
            onClick = { },
            icon = { },
            label = { Text("Entradas") },
            colors = NavigationBarItemDefaults.colors(
                selectedIconColor = selectedColor,
                selectedTextColor = selectedColor,
                unselectedIconColor = unselectedColor,
                unselectedTextColor = unselectedColor,
                indicatorColor = Color(0xFFD0BCFF)
            )
        )

        NavigationBarItem(
            selected = false,
            onClick = {  },
            icon = {  },
            label = { Text("Salidas") },
            colors = NavigationBarItemDefaults.colors(
                selectedIconColor = selectedColor,
                selectedTextColor = selectedColor,
                unselectedIconColor = unselectedColor,
                unselectedTextColor = unselectedColor,
                indicatorColor = Color(0xFFD0BCFF)
            )
        )

        NavigationBarItem(
            selected = false,
            onClick = { },
            icon = {  },
            label = { Text("Proveedores") },
            colors = NavigationBarItemDefaults.colors(
                selectedIconColor = selectedColor,
                selectedTextColor = selectedColor,
                unselectedIconColor = unselectedColor,
                unselectedTextColor = unselectedColor,
                indicatorColor = Color(0xFFD0BCFF)
            )
        )
    }
}

@Composable
fun MetricCardsSection() {
    Column(verticalArrangement = Arrangement.spacedBy(16.dp)) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            MetricCard(title = "Entradas", value = "1,250", color = Color(0xFF4CAF50), modifier = Modifier.weight(1f))
            MetricCard(title = "Salidas", value = "980", color = Color(0xFFF44336), modifier = Modifier.weight(1f))
        }
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            MetricCard(title = "Stock", value = "5,320", color = Color(0xFF2196F3), modifier = Modifier.weight(1f))
            MetricCard(title = "Clientes", value = "89", color = Color(0xFFFF9800), modifier = Modifier.weight(1f))
        }
    }
}

@Composable
fun MetricCard(title: String, value: String, color: Color, modifier: Modifier = Modifier) {
    Box(
        modifier = modifier
            .clip(RoundedCornerShape(12.dp))
            .background(color.copy(alpha = 0.1f))
            .padding(16.dp)
    ) {
        Column(horizontalAlignment = Alignment.CenterHorizontally, modifier = Modifier.fillMaxWidth()) {
            Text(text = title, style = MaterialTheme.typography.labelLarge, color = color)
            Spacer(modifier = Modifier.height(8.dp))
            Text(text = value, style = MaterialTheme.typography.headlineMedium, fontWeight = FontWeight.Bold)
        }
    }
}

data class Movement(val description: String, val amount: Double, val time: String, val isIncome: Boolean)

fun getSampleMovements(): List<Movement> {
    val sdf = SimpleDateFormat("hh:mm a", Locale.getDefault())
    return listOf(
        Movement("Venta de 5 Sillas de Oficina", 450.00, sdf.format(Date()), true),
        Movement("Compra de 20 Teclados", 800.00, "11:30 AM", false),
        Movement("Venta de 2 Monitores", 600.00, "10:15 AM", true),
        Movement("Pago a proveedor 'TecnoCorp'", 1200.00, "09:00 AM", false)
    )
}

@Preview(showBackground = true, showSystemUi = true)
@Composable
fun HomeScreenPreview() {

}
