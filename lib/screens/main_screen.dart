import 'package:flutter/material.dart';
import 'package:rent_a_car/screens/login_screen.dart';
import 'package:rent_a_car/screens/signup_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    backgroundColor: Color.fromRGBO(155, 218, 223, 0.9),
      appBar: AppBar(
         backgroundColor: Color.fromRGBO(155, 218, 223, 0.9),
        title: Text("Login Or SignUp"),
      ),
      body: SingleChildScrollView(child: Column(
        children: [
         SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text("If you dont have an account please signup. Or else login to your account with your email and password.",
           textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700
            ),),
          ),
            SizedBox(
          height: 20,
        ),
      ElevatedButton(onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
      }, child: Text("Login")),
      SizedBox(
          height: 20,
        ),
      ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
}, child: Text("SignUp"))

        ],
      ),),
    );
  }
}