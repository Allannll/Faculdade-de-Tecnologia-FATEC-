import 'package:flutter/material.dart';
import 'package:proj_eng/model/Constants/colors.dart';
import 'package:proj_eng/services/auth_service.dart';

class AuthenticatorRepository {

  static final AuthenticatorRepository _instance = AuthenticatorRepository._internal();
  factory AuthenticatorRepository() => _instance;
  AuthenticatorRepository._internal();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();

  Authentication _authentication = Authentication();

  final List<Map<String, String>> _registeredUsers = [];

  Map<String, String>? _loggedInUser;
  Map<String, String>? get loggedInUser => _loggedInUser;

  bool handleRegister(BuildContext context) {
    final emailReg = emailController.text.trim();
    final passwordReg = passwordController.text.trim();
    final name = nameController.text.trim();
    final lastName = lastNameController.text.trim();

    if (emailReg.isEmpty || passwordReg.isEmpty || name.isEmpty || lastName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: DefaultColors.componentFont,
          content: Text("Preencha todos os campos", style: TextStyle(color: DefaultColors.font)),

        ),
      );
      return false;
    }

    // _registeredUsers.add({
    //   "email": emailReg,
    //   "password": passwordReg,
    //   "name": name,
    //   "lastName": lastName,
    // });

    _authentication.registerUser(
      email: emailReg, 
      name: name, 
      password: passwordReg
    );

      // for (var user in _registeredUsers) {
      //   print("Email: ${user['email']}, Senha: ${user['password']}");
      // 

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: DefaultColors.componentFont,
        content: Text("Usuário $name cadastrado com sucesso!", style: TextStyle(color: DefaultColors.font))
      ),
    );
    return true;
  }

bool handleLogin(BuildContext context) {
  final emailLogin = emailLoginController.text.trim();
  final passwordLogin = passwordLoginController.text.trim();

  // Encontra o usuário com email e senha correspondentes
  final user = _registeredUsers.firstWhere(
    (user) => user['email'] == emailLogin && user['password'] == passwordLogin,
    orElse: () => {},
  );

  if (user.isNotEmpty) {
    _loggedInUser = user; // Armazena o usuário logado

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: DefaultColors.componentFont,
        content: Text("Login bem-sucedido!", style: TextStyle(color: DefaultColors.font)),
      ),
    );
    return true;
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: DefaultColors.componentFont,
        content: Text("E-mail ou senha inválidos.", style: TextStyle(color: DefaultColors.font)),
      ),
    );
    return false;
  }
}


  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    lastNameController.dispose();
  }
}
