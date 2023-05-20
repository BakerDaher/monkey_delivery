import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:monkey_delivery/helper/constant/String.dart';
import 'package:monkey_delivery/presentation/Widgets/Button.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  late TextEditingController pinController ;
  final focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>() ;

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 24 ,
      color: Colors.black ,
    ),
    decoration: BoxDecoration(
      color: Colors.grey.shade300 ,
      borderRadius: BorderRadius.circular(19),
    ),
  );

  @override
  void initState() {
    pinController = TextEditingController();

    // TODO: implement initState
    super.initState();

  }
  @override
  void dispose() {
    pinController.dispose() ;
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
              const Text("We have sent an OTP to\nyour Mobile",
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
              const Text("Please check your mobile number 071*****12\ncontinue to reset your password",
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
                    Container(
                      width: 307 ,
                      child: Pinput(
                        length: 4, // defoult
                        keyboardType: TextInputType.number ,
                        obscureText: true ,
                        obscuringCharacter: "*" ,
                        mainAxisAlignment: MainAxisAlignment.spaceAround ,
                        controller: pinController,
                        focusNode: focusNode,
                        // Pinput will listen multiple sms codes, helpful if user request another sms code
                        androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                        listenForMultipleSmsOnAndroid: true,
                        defaultPinTheme: defaultPinTheme,
                        cursor: Align(
                          alignment: Alignment.bottomCenter ,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1.5 ,
                            color: Colors.red,
                          ),
                        ),
                        focusedPinTheme: defaultPinTheme.copyWith(
                           decoration: defaultPinTheme.decoration!.copyWith(
                             boxShadow: [
                               BoxShadow(
                                 blurRadius: 5 ,
                                 color: Colors.black.withOpacity(0.5) ,
                               ),
                             ],
                          ),
                        ),
                        errorPinTheme: defaultPinTheme.copyBorderWith(
                          border: Border.all(color: Colors.redAccent),
                        ),
                        submittedPinTheme: defaultPinTheme.copyBorderWith(
                          border: Border.all(color: Colors.lightBlueAccent ),
                        ),
                        validator: (value) {
                          // true value
                          if (value == '2222'){
                            Navigator.pushReplacementNamed(context, newPassScreen) ;
                            //_reset() ;
                          }
                          else
                            return 'Pin is incorrect';
                        },
                        // onCompleted: (pin) {
                        //   debugPrint('onCompleted: $pin');
                        // },
                        // onChanged: (value) {
                        //   debugPrint('onChanged: $value');
                        // },
                      ),
                    ),
                    const SizedBox(
                      height: 50 ,
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
                          Navigator.pushReplacementNamed(context, newPassScreen) ;
                          //_reset() ;
                        }
                      },
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Didn't Receive?",
                        style: const TextStyle(
                          color: Color(0xff7C7D7E) ,
                          fontSize: 16 ,
                          fontFamily: "Metrophobic" ,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: " Click Here",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor ,
                              fontSize: 16 ,
                              fontFamily: "Metrophobic" ,
                              fontWeight: FontWeight.bold ,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {

                              } ,
                          ),
                        ],
                      ),
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
