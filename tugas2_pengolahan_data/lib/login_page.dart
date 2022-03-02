import 'package:flutter/material.dart';

class  extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Login Screen'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo(),
              _email(),
              _password(),
              _loginButton(context),
              _forgotPassword(),
            ],
          )
      ),
    );
  }
}


class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(

  }

  Widget logo(){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 60),
        child: FlutterLogo(
          size: 30,
        )
    );
  }
  Widget _email(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        enabled: true,
        decoration: const InputDecoration(
            hintText: 'Email',
            contentPadding: const EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(color: Colors.blue),
            )
        ),
      ),
    );
  }

  Widget _password(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        decoration: const InputDecoration(
            hintText: 'Password',
            contentPadding: const EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(color: Colors.blue),
            )
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context){
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      child : ElevatedButton(
        onPressed: (){},
        child: const Text("Log In"),
      ),
    );
  }

  Widget _forgotPassword(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child : Text("Forgot password?"),
    );
  }
}
