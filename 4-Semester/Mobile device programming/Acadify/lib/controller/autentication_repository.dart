import 'package:flutter/material.dart';
import 'package:proj_eng/model/Constants/colors.dart';
import 'package:proj_eng/services/auth_service.dart';

class AuthenticatorRepository {

  static final AuthenticatorRepository _instance = AuthenticatorRepository._internal();
  factory AuthenticatorRepository() => _instance;
  AuthenticatorRepository._internal();

 //Register and change
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  //Login
  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();

  //Forget password
  final TextEditingController forgetPasswordController = TextEditingController();

  final Authentication _authentication = Authentication();

  // final List<Map<String, String>> _registeredUsers = []; //Local

  Map<String, String>? _loggedInUser;
  Map<String, String>? get loggedInUser => _loggedInUser;

  bool _isStrongPassword(String password) {
  final hasUppercase = password.contains(RegExp(r'[A-Z]'));
  final hasNumber = password.contains(RegExp(r'[0-9]'));
  final hasSpecialChar = password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));
  return hasUppercase && hasNumber && hasSpecialChar;
  }

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


    if (!_isStrongPassword(passwordReg)) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: DefaultColors.componentFont,
        content: Text(
          "A senha deve conter pelo menos uma letra maiúscula, um número e um caractere especial.",
          style: TextStyle(color: DefaultColors.font),
        ),
      ),
    );
    return false;
  }

    //local register
    // _registeredUsers.add({
    //   "email": emailReg,
    //   "password": passwordReg,
    //   "name": name,
    //   "lastName": lastName,
    // });

    //Firebase register
    _authentication.registerUser(
      email: emailReg, 
      name: name, 
      lastName: lastName,
      password: passwordReg
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: DefaultColors.componentFont,
        content: Text("Usuário $name cadastrado com sucesso!", style: TextStyle(color: DefaultColors.font))
      ),
    );
    return true;
  }

  bool handleUpdateUser(BuildContext context) {
    final emailReg = emailController.text.trim();
    final name = nameController.text.trim();
    final lastName = lastNameController.text.trim();

    if (emailReg.isEmpty || name.isEmpty || lastName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: DefaultColors.componentFont,
          content: Text("Não é póssível salvar nenhum dado.", style: TextStyle(color: DefaultColors.font)),

        ),
      );
      return false;
    }

    try {
      _authentication.updateUser(
        email: emailReg, 
        name: name, 
        lastName: lastName,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: DefaultColors.componentFont,
          content: Text("Atualizações realizadas com sucesso.", style: TextStyle(color: DefaultColors.font))
        ),
      );
      return true;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: DefaultColors.componentFont,
          content: Text(
            "Não foi possível atualizar seus dados. Tente novamente mais tarde!",
              style: TextStyle(color: DefaultColors.font),
          ),
        ),
      );
      return false;
    }
  }

  Future<bool> handleLogin(BuildContext context) async {
    final emailLogin = emailLoginController.text.trim();
    final passwordLogin = passwordLoginController.text.trim();

    try {
        await _authentication.loginUser(
        email: emailLogin,
        password: passwordLogin,
      );
      if (!context.mounted) return false;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: DefaultColors.componentFont,
          content: Text(
            "Login bem-sucedido!",
            style: TextStyle(color: DefaultColors.font),
          ),
        ),
      );  
      return true; 
    } catch (e) {
       if (!context.mounted) return false;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: DefaultColors.componentFont,
            content: Text(
              "E-mail ou senha inválidos.",
              style: TextStyle(color: DefaultColors.font),
            ),
          ),
        );
      return false;
    }
  }

  Future<bool> handleForgetPassword(BuildContext context) async {
    final forgetEmail = forgetPasswordController.text.trim();

    try {
      await _authentication.passwordReset(email: forgetEmail);
      return true;
    } catch (e) {
      if (!context.mounted) return false;
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: DefaultColors.componentFont,
          content: Text(
            "Erro ao enviar o e-mail de recuperação.",
            style: TextStyle(color: DefaultColors.font),
          ),
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
