import 'package:flutter/material.dart';
import 'package:monkey_delivery/helper/constant/String.dart';
import 'package:monkey_delivery/presentation/Widgets/Button.dart';
import '../Widgets/TextFormFaild.dart';

class NewPassScreen extends StatefulWidget {
  const NewPassScreen({Key? key}) : super(key: key);

  @override
  State<NewPassScreen> createState() => _NewPassScreenState();
}

class _NewPassScreenState extends State<NewPassScreen> {
  late TextEditingController _pass ;
  late TextEditingController _pass_Config ;
  final _formKey = GlobalKey<FormState>() ;

  @override
  void initState() {
    _pass = TextEditingController() ;
    _pass_Config = TextEditingController() ;
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _pass_Config.dispose() ;
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
                height: 60,
              ),
              const Text("New Password",
                style: TextStyle(
                  color: Color(0xff4A4B4D) ,
                  fontSize: 30 ,
                  fontFamily: "Metrophobic" ,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15 ,
              ),
              const Text("Please enter your email to receive a\nlink to  create a new password via email",
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
                      height: 60 ,
                    ) ,
                    TextFromFaild(
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
                      text_controller: _pass ,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFromFaild(
                      text_controller:  _pass_Config,
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
                      height: 40 ,
                    ) ,
                    Button_ON(
                      title_size: 16 ,
                      background_color: Theme.of(context).primaryColor ,
                      title_color: Colors.white,
                      title: "Next",
                      fun: (){
                        // check the form Valid or notValid
                        // in all validator inside Forn >> key = _formKey
                        if (_formKey.currentState!.validate() ){
                          Navigator.pop(context) ;
                          Navigator.pop(context) ;
                          //_reset() ;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
