import 'package:flutter/material.dart';
import 'package:rent_a_car/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _textEditingEmailController = TextEditingController();
    TextEditingController _textEditingPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
           SizedBox(
              height: 30,
            ),
            Center(
              child: Text("Please enter your email id and password to login",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20
              ),),
            ),
            SizedBox(
              height: 20,
            ),
loginDetails(text: "Enter your email id",controllerName: _textEditingEmailController,type: TextInputType.emailAddress,iconName:Icons.email_rounded),
loginDetails(text: "Enter your password",controllerName: _textEditingPasswordController,type: TextInputType.visiblePassword,iconName:Icons.password ),
     SizedBox(
                height: 40,
               ),
        ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                }, child: Text("Login",style: TextStyle(color: Colors.white),))
       
        ],),
      ),
    );
  }

loginDetails({String? text,TextEditingController? controllerName,TextInputType? type,IconData? iconName}){
  return Padding(padding: EdgeInsets.all(12),
  child:TextFormField(
  controller: controllerName,
      keyboardType: type,
decoration: InputDecoration(
  prefixIcon: Icon(iconName),
  hintText: text
),
  ) ,);
}
}