import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _textEditingNameController = TextEditingController();
    TextEditingController _textEditingAddressController = TextEditingController();
      TextEditingController _textEditingPhoneNumberController = TextEditingController();
        TextEditingController _textEditingEmailController = TextEditingController();
          TextEditingController _textEditingPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text("Please fillup the details to signup",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20
              ),),
            ),
            SizedBox(
              height: 20,
            ),
            signupDetails(text: "Enter your name",controllerName: _textEditingNameController,type: TextInputType.name,iconName:Icons.person ),
             signupDetails(text: "Enter your phone number",controllerName: _textEditingPhoneNumberController,type: TextInputType.number,iconName:Icons.call ),
             signupDetails(text: "Enter your address",controllerName: _textEditingAddressController,type: TextInputType.streetAddress,iconName:Icons.location_on ),
              signupDetails(text: "Enter your email id",controllerName: _textEditingEmailController,type: TextInputType.emailAddress,iconName:Icons.email_rounded ),
               signupDetails(text: "Enter your password",controllerName: _textEditingPasswordController,type: TextInputType.visiblePassword,iconName:Icons.password ),
               SizedBox(
                height: 30,
               ),
               ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple
                ),
                onPressed: (){
                  
                }, child: Text("Submit",style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }

  signupDetails({String? text,TextEditingController? controllerName,TextInputType? type,IconData? iconName}){
    return Padding(padding: EdgeInsets.all(12),
    child: TextFormField(
      
      controller: controllerName,
      keyboardType: type,
decoration: InputDecoration(
  prefixIcon: Icon(iconName),
  hintText: text
),
    ) ,
    );
  }
}