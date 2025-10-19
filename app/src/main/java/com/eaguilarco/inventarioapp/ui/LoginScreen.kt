package com.eaguilarco.inventarioapp.ui
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.material3.TextFieldDefaults
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import com.eaguilarco.inventarioapp.R
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.runtime.getValue
import androidx.compose.runtime.livedata.observeAsState
import com.eaguilarco.inventarioapp.data.viewModels.LoginViewModel

@Composable
fun LoginScreen(viewModel: LoginViewModel, onLoginSuccess: () -> Unit) {
    val navigate: Boolean? by viewModel.navigateToHome.observeAsState()
    if (navigate == true) {
        onLoginSuccess()
        viewModel.onNavigationDone()
    }
    Box(Modifier
        .fillMaxSize()
        .padding(16.dp)) {
        Login(Modifier.align(Alignment.Center), viewModel )
    }
}


@Composable
fun Login(modifier: Modifier, viewModel: LoginViewModel) {

    val email by viewModel.email.observeAsState(initial = "")
    val password by viewModel.password.observeAsState(initial = "")
    val isLoginEnabled by viewModel.loginEnabled.observeAsState(initial = false)

    Column(modifier = modifier) {
        Text(
            text = "Hola, Bienvenido!!!",
            modifier = Modifier.align(Alignment.CenterHorizontally)
        )
        Spacer(modifier = Modifier.padding(16.dp))
        HeaderImage(Modifier.align(Alignment.CenterHorizontally))
        Spacer(modifier = Modifier.padding(16.dp))

        EmailField(value = email, onValueChanged = { viewModel.onLoginChanged(it, password) })
        Spacer(modifier = Modifier.padding(4.dp))
        PasswordField(value = password, onValueChanged = { viewModel.onLoginChanged(email, it) })

        Spacer(modifier = Modifier.padding(16.dp))
        LoginButton(
            isLoginEnabled = isLoginEnabled,
            onLoginSelected = { viewModel.onLoginSelected() }
        )
    }
}


@Composable
fun LoginButton(isLoginEnabled: Boolean, onLoginSelected: () -> Unit) {
    Button(
        onClick = { onLoginSelected() },
        modifier = Modifier
            .fillMaxWidth()
            .height(48.dp),
        enabled = isLoginEnabled,
        colors = ButtonDefaults.buttonColors(
            containerColor = Color(0xFF380D80),
            contentColor = Color.White,
            disabledContainerColor = Color(0xFF845BCE),
            disabledContentColor = Color.White
        )
    ) {
        Text(text = "Iniciar Sesión")
    }
}
@Composable
fun PasswordField(value: String, onValueChanged: (String) -> Unit) {
    Column {
        Text(
            text = "Contraseña",
            color = Color(0xFF380D80)
        )
        Spacer(modifier = Modifier.padding(4.dp))
        TextField(
            value = value,
            onValueChange = { onValueChanged(it) },
            placeholder = { Text(text = "Ingresa tu contraseña") },
            modifier = Modifier.fillMaxWidth(),
            keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password),
            singleLine = true,
            maxLines = 1,
            colors = TextFieldDefaults.colors(
                unfocusedContainerColor = Color(0xFFDEDDDD),
                focusedContainerColor = Color(0xFFDEDDDD),
                unfocusedTextColor = Color(0xFF380D80),
                focusedTextColor = Color(0xFF380D80),
                focusedIndicatorColor = Color.Transparent,
                unfocusedIndicatorColor = Color.Transparent,
                disabledIndicatorColor = Color.Transparent
            )
        )
    }
}
@Composable
fun EmailField(value: String, onValueChanged: (String) -> Unit) {
    Column {
        Text(
            text = "Usuario",
            color = Color(0xFF380D80)
        )
        Spacer(modifier = Modifier.padding(4.dp))
        TextField(
            value = value,
            onValueChange = { onValueChanged(it) },
            modifier = Modifier.fillMaxWidth(),
            placeholder = { Text(text = "Ingresa tu usuario") },
            keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Email),
            singleLine = true,
            maxLines = 1,
            colors = TextFieldDefaults.colors(
                unfocusedContainerColor = Color(0xFFDEDDDD),
                focusedContainerColor = Color(0xFFDEDDDD),
                unfocusedTextColor = Color(0xFF380D80),
                focusedTextColor = Color(0xFF380D80),
                focusedIndicatorColor = Color.Transparent,
                unfocusedIndicatorColor = Color.Transparent,
                disabledIndicatorColor = Color.Transparent
            )
        )
    }
}
@Composable
fun HeaderImage(modifier: Modifier) {
    Image(painter = painterResource(id = R.drawable.aris),
        contentDescription = "Header",
        modifier = modifier.size(150.dp)
    )
}
