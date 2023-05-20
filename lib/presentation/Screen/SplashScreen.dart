import 'package:flutter/material.dart';
import 'package:monkey_delivery/helper/constant/String.dart';
import 'package:monkey_delivery/presentation/Widgets/Button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class Onbording{
  late String img ;
  late String title ;
  late String disc ;
  Onbording(
    {
      required this.img ,
      required this.title ,
      required this.disc
    }
  ) ;
}
class _SplashScreenState extends State<SplashScreen> {
  final List<Onbording> content = [
    Onbording(
      img : "images/img1.png" ,
      title : "Find Food You Love" ,
      disc : "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep"
    ),
    Onbording(
        img : "images/img2.png" ,
        title : "Fast Delivery" ,
        disc : "Fast food delivery to your home, office wherever you are"
    ),
    Onbording(
        img : "images/img3.png" ,
        title : "Live Tracking" ,
        disc : "Real time tracking of your food on the app once you placed the order"
    ),
  ] ;
  int current = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 36),
          child: Stack(
            children:[
              Column(
                children: [
                  const SizedBox(
                    height: 40 ,
                  ),
                  Expanded(
                    child: PageView.builder(
                      itemCount: content.length,
                      onPageChanged: (int i){
                        setState(() {
                          current = i ;
                        });
                      },
                      // i >> counter to slide >> slide1 = 0 , slide2 = 1 , slide3 = 2
                      itemBuilder: (_, i) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(content[i].img),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(content[i].title,
                                style: const TextStyle(
                                  color: Color(0xff4A4B4D),
                                  fontSize: 28,
                                  fontFamily: "Metrophobic",
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(content[i].disc,
                                style: const TextStyle(
                                  color: Color(0xff7C7D7E),
                                  fontSize: 13,
                                  fontFamily: "Metrophobic",
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Button_ON(
                    title: "Next",
                    fun: () {
                      // Navigator.pushReplacementNamed(context, homeScreen) ;
                      Navigator.pushNamed(context, homeScreen);
                    },
                    title_size: 18,
                    background_color: Theme
                        .of(context)
                        .primaryColor,
                    title_color: Colors.white,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 115),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    content.length,
                        (index) => Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            20),
                        color: ( current == index ) ? Theme
                            .of(context)
                            .primaryColor : Colors.grey ,
                      ),
                    ) ,
                  ),
                ),
              ),
            ] ,
          ),
        )
    );
  }
}