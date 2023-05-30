import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerNickname = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text,
          name: _controllerName.text,
          nickname: _controllerNickname.text
      );
    } on FirebaseAuthException catch(e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await Auth().signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _signInWithGoogleButton() {
    return ElevatedButton.icon(
      onPressed: signInWithGoogle,
      icon: FaIcon(FontAwesomeIcons.google, color: Colors.white),
      label: Text(
        'Войти с помощью Google аккаунта',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(72, 190, 189, 1), // Change the button color as desired
      ),
    );
  }

  Widget _title() {
    return const Text(
      'Nomad Audio',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
    );
  }

  Widget _entryField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
      obscureText: title.toLowerCase().contains('пароль'), // Set obscureText to true for any field containing 'password' in its title
    );
  }

  Widget _errorMesage() {
    return Text(errorMessage == '' ? '' : 'Login or password is incorrect');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(
        isLogin ? 'Войти' : 'Зарегистрироваться',
      ),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(
          isLogin ? 'У меня нет аккаунта' : 'У меня есть аккаунт'
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _entryField('почта', _controllerEmail),
            _entryField('пароль', _controllerPassword),
            if (!isLogin) _entryField('имя', _controllerName),
            if (!isLogin) _entryField('никнейм', _controllerNickname),
            SizedBox(height: 10,),
            _errorMesage(),
            _submitButton(),
            _loginOrRegisterButton(),
            SizedBox(height: 10,),
            _signInWithGoogleButton(),
          ],
        ),
      ),
    );
  }
}
