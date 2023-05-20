import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:monkey_delivery/helper/constant/String.dart';
import 'package:monkey_delivery/presentation/Widgets/Button.dart';
import '../Widgets/TextFormFaild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>() ;
  late TextEditingController _email  ;
  late TextEditingController _pass ;

  @override
  void initState() {
    _pass = TextEditingController() ;
    _email = TextEditingController() ;
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose() ;
    _pass.dispose() ;
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
                height: 30,
              ),
              const Text("Login",
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
              const Text("Add your details to login",
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
                      height: 25 ,
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
                      height: 25,
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
                      height: 25,
                    ) ,
                    Button_ON(
                      title_size: 16 ,
                      background_color: Theme.of(context).primaryColor ,
                      title_color: Colors.white,
                      title: "Login",
                      fun: (){
                        // check the form Valid or notValid
                        // in all validator inside Forn >> key = _formKey
                        if (_formKey.currentState!.validate() ){
                          Navigator.pop(context) ;
                          Navigator.pop(context) ;
                          Navigator.pushNamed(context, splashScreen ) ;
                          //_Login() ;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ) ,
                    RichText(
                      text: TextSpan(
                        text: "",
                        children: <TextSpan>[
                          TextSpan(
                            text: "Forgot your Password?",
                            style: const TextStyle(
                              color: Color(0xff7C7D7E) ,
                              fontSize: 16 ,
                              fontFamily: "Metrophobic" ,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  Navigator.pushNamed(context, resetScreen ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ) ,
                    const Text("or Login With",
                      style: TextStyle(
                        color: Color(0xff7C7D7E) ,
                        fontSize: 16 ,
                        fontFamily: "Metrophobic" ,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 25,
                    ) ,
                    Button_ON(
                      icon: Icons.facebook,
                      title_size: 12 ,
                      background_color: Color(0xff367FC0) ,
                      title_color: Colors.white,
                      title: "Login with Facebook",
                      fun: (){},
                    ),
                    const SizedBox(
                      height: 20,
                    ) ,
                    Button_ON(
                      icon: Icons.g_mobiledata_outlined,
                      title_size: 12 ,
                      background_color: Color(0xffDD4B39) ,
                      title_color: Colors.white,
                      title: "Login with Google",
                      fun: (){},
                    ),
                    const SizedBox(
                      height: 40,
                    ) ,
                    RichText(
                      text: TextSpan(
                        text: "Don't have an Account?",
                        style: const TextStyle(
                          color: Color(0xff7C7D7E) ,
                          fontSize: 16 ,
                          fontFamily: "Metrophobic" ,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: " Sign Up",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor ,
                              fontSize: 16 ,
                              fontFamily: "Metrophobic" ,
                              fontWeight: FontWeight.bold ,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                  Navigator.pushReplacementNamed(context, sinupScreen ) ;
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