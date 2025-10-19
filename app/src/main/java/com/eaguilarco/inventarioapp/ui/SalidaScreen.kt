package com.eaguilarco.inventarioapp.ui

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SalidaScreen(
    onNavigateToHome: () -> Unit,
    onNavigateToEntradas: () -> Unit,
    onNavigateToProveedores: () -> Unit
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Crear Salida") },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = Color(0xFF380D80),
                    titleContentColor = Color.White
                )
            )
        },
        bottomBar = {

        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            item {
                SalidaForm()
                Spacer(modifier = Modifier.height(24.dp))
                Divider()
                Spacer(modifier = Modifier.height(16.dp))
            }

            item {
                Text(
                    text = "Productos en Stock",
                    style = MaterialTheme.typography.titleLarge,
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(bottom = 8.dp)
                )
            }
            items(getSampleProducts()) { product ->
                ProductStockItem(product)
            }
        }
    }
}

@Composable
fun SalidaForm() {
    var cantidad by remember { mutableStateOf("") }
    var proveedor by remember { mutableStateOf("") }

    Column(
        modifier = Modifier.fillMaxWidth(),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {

        Text("Cantidad", fontWeight = FontWeight.Bold)
        TextField(
            value = cantidad,
            onValueChange = { cantidad = it },
            placeholder = { Text("Ingresa aquí") },
            keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Number),
            modifier = Modifier.fillMaxWidth()
        )

        Text("Cliente / Destino", fontWeight = FontWeight.Bold)
        TextField(
            value = proveedor,
            onValueChange = { proveedor = it },
            placeholder = { Text("Ingresa nombre") },
            modifier = Modifier.fillMaxWidth()
        )

        Button(
            onClick = { /* TODO: Lógica para agregar la salida */ },
            modifier = Modifier
                .fillMaxWidth()
                .height(48.dp),
            colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF4CAF50))
        ) {
            Icon(Icons.Default.Add, contentDescription = "Agregar")
            Spacer(modifier = Modifier.width(8.dp))
            Text("Agregar Salida")
        }
    }
}

@Composable
fun ProductStockItem(product: Product) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Row(
            modifier = Modifier
                .padding(16.dp)
                .fillMaxWidth(),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Column(modifier = Modifier.weight(1f)) {
                Text(product.name, fontWeight = FontWeight.Bold, fontSize = 16.sp)
                Text("Precio: $${product.price}", style = MaterialTheme.typography.bodyMedium)
            }
            Text("Stock: ${product.stock}", color = Color.Gray, fontWeight = FontWeight.Medium)
        }
    }
}

data class Product(val name: String, val price: Double, val stock: Int)

fun getSampleProducts(): List<Product> {
    return listOf(
        Product("Olla de acero Innova", 150.00, 30),
        Product("Sartén con mango de silicona", 85.50, 50),
        Product("Juego de 24 Tenedores de mesa", 45.00, 120),
        Product("Cuchillos de acero negro (x6)", 99.90, 80),
        Product("Vajilla de cerámica para 4 personas", 320.00, 15),
        Product("Set de copas de vino (x4)", 180.00, 40),
        Product("Tabla para picar de bambú", 55.00, 75)
    )
}

@Preview(showBackground = true, showSystemUi = true)
@Composable
fun SalidaScreenPreview() {
    SalidaScreen(
        onNavigateToHome = {},
        onNavigateToEntradas = {},
        onNavigateToProveedores = {}
    )
}
