import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/model/boxes.dart';
import 'package:news_app/model/users.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey =
  GlobalKey<FormState>();
  validated() {
    if (_formKey.currentState != null &&
        _formKey.currentState!.validate()) {
      _onFormSubmit();
      print("Form Validated");
    } else {
      print("Form not validated");
      return;
    }
  }
  late String username;
  late String password;

  void _onFormSubmit(){
    Box<Todo> usersBox = Hive.box<Todo>(HiveBoxex.users);
    usersBox.add(Todo(username: username, password: password));
    Navigator.of(context).pop();
    print(usersBox);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(labelText: 'Username'),
                      validator: (String? value) {
                        if (value == null || value.trim().length == 0) {
                          return "Required";
                        }
                        return null;
                      },
                      onChanged: (value){
                        username = value;
                      }
                  ),
                  TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (String? value) {
                        if (value == null || value.trim().length == 0) {
                          return "Required";
                        }
                        return null;
                      },
                      onChanged: (value){
                        password = value;
                      }
                  ),
                  ElevatedButton(onPressed: () {
                    validated();},
                      child: Text('Create Account'))
                ],
              ),
            )
        ),
      ),
    );
  }
}
