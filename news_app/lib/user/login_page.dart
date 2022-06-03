import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/home.dart';
import 'package:news_app/model/boxes.dart';
import 'package:news_app/model/users.dart';
import 'package:news_app/user/signin_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose(){
    Hive.close();
    super.dispose();
  }

  final username_controller = TextEditingController();
  final password_controller = TextEditingController();

  late SharedPreferences logindata;
  late bool status;
  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login()async{
    logindata = await SharedPreferences.getInstance();
    status = (logindata.getBool("user") ?? true);

    print(status);

    if(status == false){
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context){
        return Home();
      }));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Text("LOGIN", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            _usernameField(),
            _passwordField(),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _usernameField(){
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: username_controller,
        decoration: InputDecoration(
            labelText: 'Username'
        ),
      ),
    );
  }

  Widget _passwordField(){
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: password_controller,
        decoration: InputDecoration(
            labelText: 'Password'
        ),
      ),
    );
  }

  Widget _loginButton(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: (){
              String username = username_controller.text;
              String password = password_controller.text;

              if(username != '' && password !=''){
                print('Successfull');
                logindata.setBool('user',false);
                logindata.setString('username',username);

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return Home();
                }));
              }
            },
            child: Text("Login"),
          ),
          ElevatedButton(
            onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return SignInPage();
                }));

            },
            child: Text("Sign In"),
          ),
        ],
      ),
    );
  }

  Widget _userList(){
    return ValueListenableBuilder(
      valueListenable:
      Hive.box<Todo>(HiveBoxex.users).listenable(),
      builder: (context, Box<Todo> box, _){
        return ListView.builder(
          itemCount: box.values.length,
          itemBuilder: (context, index){
            Todo? res = box.getAt(index);
            return Dismissible(
              background: Container(
                color: Colors.red,
              ),
              key: UniqueKey(),
              onDismissed: (direction){
                res!.delete();
              },
              child: ListTile(
                title: Text(res!.username),
                subtitle: Text(res!.password),
              ),
            );
          },
        );
      },
    );
  }
}
