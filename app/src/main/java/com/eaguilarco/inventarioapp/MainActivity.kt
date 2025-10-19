package com.eaguilarco.inventarioapp

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.viewModels
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.eaguilarco.inventarioapp.ui.HomeScreen
import com.eaguilarco.inventarioapp.ui.LoginScreen
import com.eaguilarco.inventarioapp.data.viewModels.LoginViewModel
import com.eaguilarco.inventarioapp.ui.SalidaScreen
import com.eaguilarco.inventarioapp.ui.theme.InventarioAppTheme

class MainActivity : ComponentActivity() {
    private val loginViewModel: LoginViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            InventarioAppTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    AppNavigation(loginViewModel)
                }
            }
        }
    }
}


@Composable
fun AppNavigation(viewModel: LoginViewModel) {
    val navController = rememberNavController()

    NavHost(navController = navController,
        startDestination = "login"
    ) {

        composable("login") {
            LoginScreen(
                viewModel = viewModel,
                onLoginSuccess = {
                    navController.navigate("home") {
                        popUpTo("login") { inclusive = true }
                    }
                }
            )
        }

        composable("home") {
            HomeScreen(
                onNavigateToSalidas = { navController.navigate("salidas") },
                onNavigateToEntradas = {},
                onNavigateToProveedores = { }
            )
        }

        // --- CAMBIO 2: Añade la nueva ruta "salidas" ---
        composable("salidas") {
            SalidaScreen(
                onNavigateToHome = { navController.navigate("home") },
                onNavigateToEntradas = { },
                onNavigateToProveedores = { }
            )
        }

    }
}

