import 'package:flutter/material.dart';
import 'package:monkey_delivery/helper/constant/String.dart';
import 'package:monkey_delivery/presentation/Widgets/Button.dart';
import 'package:monkey_delivery/presentation/Widgets/HeaderWidget.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({Key? key}) : super(key: key);

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height ,
            child : Center(
              child: Image.asset("images/logo.png"),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                // desin
                Container(
                  height: MediaQuery.of(context).size.height * 0.5 ,
                  child: const HeaderWidget() ,
                ),
                const SizedBox(
                  height: 120,
                ),
                const Text(
                  "Discover the best foods from over 1,000 \nrestaurants and fast delivery to your doorstep" ,
                  style: TextStyle(
                    fontSize: 13 ,
                    color: Color(0xff7C7D7E) ,
                    fontFamily: "Metrophobic" ,
                  ),
                  textAlign: TextAlign.center,
                ) ,
                const SizedBox(
                  height: 34,
                ),
                Button_ON(
                  title: "Login",
                  title_color: Colors.white,
                  title_size: 18 ,
                  background_color: Theme.of(context).primaryColor ,
                  fun: (){
                    Navigator.pushNamed(context, loginScreen ) ;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Button_ON(
                  title: "Create an Account",
                  title_color: Theme.of(context).primaryColor ,
                  border_color: Theme.of(context).primaryColor ,
                  border_width: 2.0 ,
                  title_size: 18 ,
                  background_color: Colors.transparent ,
                  fun: (){
                    Navigator.pushNamed(context, sinupScreen ) ;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ) ;
  }
}