import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Bezier Curves
        ClipPath(
          clipper: ShapeClipper(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).accentColor,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp ,
              ),
            ),
          ),
        ) ,
        Positioned(
          left: -61,
          top: -55 ,
          child: CircleAvatar(
            radius: 89 ,
           // foregroundColor: Colors.white ,
            backgroundColor: Colors.white.withOpacity(0.15),
          ),
        ),
        Positioned(
          left: 240 ,
          top: -140 ,
          child:CircleAvatar(
            radius: 144.5 ,
            // foregroundColor: Colors.white ,
            backgroundColor: Colors.white.withOpacity(0.15),
          ),
        ),
        Positioned(
          left: 230 ,
          top: 150 ,
          child:CircleAvatar(
            radius: 18 ,
            // foregroundColor: Colors.white ,
            backgroundColor: Colors.white.withOpacity(0.15),
          ),
        ),
        Positioned(
          left : 155 ,
          top: 70,
          child:CircleAvatar(
            radius: 12 ,
            // foregroundColor: Colors.white ,
            backgroundColor: Colors.white.withOpacity(0.15),
          ),
        ),
        Positioned(
          left : 167 ,
          top: 170 ,
          child:CircleAvatar(
            radius: 10 ,
            // foregroundColor: Colors.white ,
            backgroundColor: Colors.white.withOpacity(0.15),
          ),
        ),
        Positioned(
          left: 30 ,
          top: 80 ,
          child:CircleAvatar(
            radius: 55 ,
            // foregroundColor: Colors.white ,
            backgroundColor: Colors.white.withOpacity(0.15),
          ),
        ),
        Positioned(
          left: -100 ,
          top: 200 ,
          child:CircleAvatar(
            radius: 120 ,
            // foregroundColor: Colors.white ,
            backgroundColor: Colors.white.withOpacity(0.15),
          ),
        ),
        Positioned(
          right : -5 ,
          top: 270 ,
          child:CircleAvatar(
            radius: 10 ,
            // foregroundColor: Colors.white ,
            backgroundColor: Colors.white.withOpacity(0.15),
          ),
        ),
        Positioned(
          right : -15 ,
          top: 120 ,
          child: Icon(
            Icons.delivery_dining_outlined ,
            color: Colors.white.withOpacity(0.15),
            size: 180 ,
          ) ,
        ),
      ],
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  ShapeClipper();
  // Drow curves
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0,size.height*0.8921196);
    path.quadraticBezierTo(size.width*-0.0022604,size.height*0.9310995,size.width*0.0274896,size.height*0.9427174);
    path.lineTo(size.width*0.2509062,size.height*0.9430686);
    path.quadraticBezierTo(size.width*0.3142951,size.height*0.9280853,size.width*0.3152917,size.height*0.8662793);
    path.cubicTo(size.width*0.3182326,size.height*0.7488712,size.width*0.3636597,size.height*0.6450418,size.width*0.5001354,size.height*0.6440468);
    path.cubicTo(size.width*0.6324062,size.height*0.6425251,size.width*0.6862917,size.height*0.7522952,size.width*0.6856111,size.height*0.8666304);
    path.quadraticBezierTo(size.width*0.6870937,size.height*0.9272074,size.width*0.7503611,size.height*0.9426881);
    path.lineTo(size.width*0.9723924,size.height*0.9431564);
    path.quadraticBezierTo(size.width*0.9999792,size.height*0.9286120,size.width,size.height*0.8912124);
    path.quadraticBezierTo(size.width*1.0086076,size.height*0.6554306,size.width,0);
    path.lineTo(0,0);
    path.quadraticBezierTo(0,size.height*0.2198913,0,size.height*0.8921196);
    path.close();

    return path ;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}