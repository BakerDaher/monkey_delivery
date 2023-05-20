import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:monkey_delivery/helper/constant/String.dart';
import 'package:monkey_delivery/presentation/Widgets/Button.dart';

import '../Widgets/TextFormFaild.dart';

class SinupScreen extends StatefulWidget {
  const SinupScreen({Key? key}) : super(key: key);

  @override
  State<SinupScreen> createState() => _SinupScreenState();
}

class _SinupScreenState extends State<SinupScreen> {
  final _formKey = GlobalKey<FormState>() ;
  late TextEditingController _email  ;
  late TextEditingController _pass ;
  late TextEditingController _pass_Config ;
  late TextEditingController _name ;
  late TextEditingController _address ;
  late TextEditingController _number ;

  @override
  void initState() {
    _pass = TextEditingController() ;
    _email = TextEditingController() ;
    _name = TextEditingController() ;
    _address = TextEditingController() ;
    _number = TextEditingController() ;
    _pass_Config = TextEditingController() ;

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose() ;
    _pass.dispose() ;
    _name.dispose() ;
    _address.dispose() ;
    _number.dispose() ;
    _pass_Config.dispose() ;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36 , vertical: 10 ),
          child: Column(
            // max size
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text("Sign Up",
                style: TextStyle(
                  color: Color(0xff4A4B4D) ,
                  fontSize: 30 ,
                  fontFamily: "Metrophobic" ,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10 ,
              ),
              const Text("Add your details to sign up",
                style: TextStyle(
                  color: Color(0xff7C7D7E) ,
                  fontSize: 16 ,
                  fontFamily: "Metrophobic" ,
                ),
                textAlign: TextAlign.center,
              ),
              Form(
                  key: _formKey ,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20 ,
                      ) ,
                      TextFromFaild(
                        text_controller: _name ,
                        // val >> this is text input
                        function: (val){
                          if(val!.isEmpty ){
                            return "Enter a Your Name" ;
                          }
                          else
                            return null ;
                        },
                        obscureText: false ,
                        hint_text: "Name",
                        label_text: "name",
                        type: TextInputType.name ,
                      ),
                      const SizedBox(
                        height: 20 ,
                      ) ,
                      TextFromFaild(
                        text_controller: _email ,
                        // val >> this is text input
                        function: (val){
                          if(val!.isEmpty || !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                            return "Enter a valid email address" ;
                          }
                          else
                            return null ;
                        },
                        obscureText: false ,
                        hint_text: "Your Email",
                        label_text: "Email",
                        type: TextInputType.emailAddress ,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFromFaild(
                        text_controller: _number ,
                        // val >> this is text input
                        function: (val){
                          if(val!.isEmpty){
                            return "Please enter your Mobile No" ;
                          }
                          else if ( val.length < 10 ){
                            return "Mobile No must be at least 10 number";
                          }
                          else
                            return null ;
                        },
                        obscureText: false ,
                        hint_text: "Mobile No",
                        label_text: "Mobile No",
                        type: TextInputType.phone ,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFromFaild(
                        text_controller: _address ,
                        // val >> this is text input
                        function: (val){
                          if(val!.isEmpty){
                            return "Please enter your Address" ;
                          }
                          else
                            return null ;
                        },
                        obscureText: false ,
                        hint_text: "Address",
                        label_text: "Address",
                        type: TextInputType.streetAddress ,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFromFaild(
                        text_controller: _pass ,
                        // val >> this is text input
                        function: (val){
                          if(val!.isEmpty){
                            return "Please enter your password" ;
                          }
                          else if ( val.length < 8 ){
                            return "Password must be at least 8 characters";
                          }
                          else
                            return null ;
                        },
                        obscureText: true ,
                        hint_text: "Your password",
                        label_text: "Password",
                        type: TextInputType.visiblePassword ,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFromFaild(
                        text_controller: _pass_Config ,
                        // val >> this is text input
                        function: (val){
                          if(val!.isEmpty){
                            return "Please enter your password" ;
                          }
                          else if ( val.length < 8 ){
                            return "Password must be at least 8 characters";
                          }
                          else if ( _pass.text != _pass_Config.text ){
                            return "Password must Same your password";
                          }
                          else
                            return null ;
                        },
                        obscureText: true ,
                        hint_text: "Confirm Password",
                        label_text: "Confirm Password",
                        type: TextInputType.visiblePassword ,
                      ),
                      const SizedBox(
                        height: 20,
                      ) ,
                      Button_ON(
                        title_size: 16 ,
                        background_color: Theme.of(context).primaryColor ,
                        title_color: Colors.white,
                        title: "Sign Up",
                        fun: (){
                          // check the form Valid or notValid
                          // in all validator inside Forn >> key = _formKey
                          if (_formKey.currentState!.validate() ){
                            //_sign_Up() ;
                            Navigator.pushReplacementNamed(context, loginScreen ) ;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ) ,
                      RichText(
                        text: TextSpan(
                          text: "Already have an Account?",
                          style: const TextStyle(
                            color: Color(0xff7C7D7E) ,
                            fontSize: 16 ,
                            fontFamily: "Metrophobic" ,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: " Login",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor ,
                                fontSize: 16 ,
                                fontFamily: "Metrophobic" ,
                                fontWeight: FontWeight.bold ,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = (){
                                  Navigator.pushReplacementNamed(context, loginScreen ) ;
                                } ,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}