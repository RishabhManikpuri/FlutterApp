import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _State extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Login App'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.purple, Colors.blue[900]])),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Tutorial',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: false,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
                Container(
                  width: double.infinity,
                  height: 60.0,
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[Colors.purple, Colors.blue[900]]),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[500],
                          offset: Offset(0.0, 1.5),
                          blurRadius: 1.5,
                        ),
                      ]),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          if (validate()) {
                            // Navigate to Home Page.
                          }
                        },
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        )),
                  ),
                ),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Does not have account?'),
                    FlatButton(
                      textColor: Colors.blue,
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }

  bool validate() {
    if (StringUtils.isNullOrEmpty(nameController.text.toString())) {
      FlutterToast(context).showToast(
        child: Text("Please enter username.."),
        toastDuration: const Duration(seconds: 2),
        gravity: ToastGravity.BOTTOM,
      );
      return false;
    } else if (StringUtils.isNullOrEmpty(passwordController.text.toString())) {
      FlutterToast(context).showToast(
        child: Text("Please enter password.."),
        toastDuration: const Duration(seconds: 2),
        gravity: ToastGravity.BOTTOM,
      );
      return false;
    } else
      FlutterToast(context).showToast(
        child: Text("Goto HomePage.."),
        toastDuration: const Duration(seconds: 2),
        gravity: ToastGravity.BOTTOM,
      );
    return true;
  }
}
