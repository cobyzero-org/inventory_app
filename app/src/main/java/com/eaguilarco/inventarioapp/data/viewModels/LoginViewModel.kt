package com.eaguilarco.inventarioapp.data.viewModels

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class LoginViewModel : ViewModel() {private val _email = MutableLiveData<String>()
    val email: LiveData<String> = _email

    private val _password = MutableLiveData<String>()
    val password: LiveData<String> = _password

    private val _loginEnabled = MutableLiveData<Boolean>()
    val loginEnabled: LiveData<Boolean> = _loginEnabled

    private val _navigateToHome = MutableLiveData<Boolean>()
    val navigateToHome: LiveData<Boolean> = _navigateToHome

    fun onLoginChanged(email: String, pass: String) {
        _email.value = email
        _password.value = pass
        _loginEnabled.value = isValidEmail(email) && isValidPassword(pass)
    }

    private fun isValidEmail(email: String): Boolean {
        return email.isNotEmpty() && email.contains("@")
    }

    private fun isValidPassword(password: String): Boolean {
        return password.length > 6
    }

    fun onLoginSelected() {
        if (_loginEnabled.value == true) {
            _navigateToHome.value = true
        }
    }
    fun onNavigationDone() {
        _navigateToHome.value = false
    }
}