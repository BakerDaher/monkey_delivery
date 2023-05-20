import 'package:flutter/material.dart';
import 'package:monkey_delivery/helper/constant/String.dart';
import 'package:monkey_delivery/presentation/Widgets/Button.dart';
import '../Widgets/TextFormFaild.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  late TextEditingController _email  ;
  final _formKey = GlobalKey<FormState>() ;

  @override
  void initState() {
    _email = TextEditingController() ;
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose() ;

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
              const Text("Reset Password",
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
                        text_controller:  _email ,
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
                        height: 40 ,
                      ) ,
                      Button_ON(
                        title_size: 16 ,
                        background_color: Theme.of(context).primaryColor ,
                        title_color: Colors.white,
                        title: "Send",
                        fun: (){
                          // check the form Valid or notValid
                          // in all validator inside Forn >> key = _formKey
                          if (_formKey.currentState!.validate() ){
                            Navigator.pushNamed(context, oTPScreen ) ;
                            //_reset() ;
                          }
                        },
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
