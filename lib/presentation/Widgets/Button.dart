import 'package:flutter/material.dart';

class Button_ON extends StatefulWidget {
  final String title ;
  final double title_size ;
  final Color title_color ;
  final Color background_color ;
  final Color? border_color ;
  final double? border_width ;
  final IconData? icon ;

  final Function() fun ;

  const Button_ON({
    required this.title ,
    required this.title_color ,
    required this.title_size,
    required this.background_color ,
    required this.fun ,
    this.border_color ,
    this.border_width ,
    this.icon ,
    Key? key}) : super(key: key);

  @override
  State<Button_ON> createState() => _Button_ONState();
}

class _Button_ONState extends State<Button_ON> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.background_color ,
        borderRadius: BorderRadius.circular(30),
        border:Border.all(color: widget.border_color ?? Colors.transparent , width: widget.border_width ?? 0.0 ) ,
      ),
      height: 56,
      width: 307 ,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent ,
          elevation: 0,
          shadowColor: Colors.transparent ,
        ),
        onPressed: widget.fun ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
          crossAxisAlignment: CrossAxisAlignment.center ,
          mainAxisSize: MainAxisSize.min ,
          children: [
            Visibility(
              // if true >> show child
              // if false >> not show child
              visible: widget.icon != null ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                crossAxisAlignment: CrossAxisAlignment.center ,
                mainAxisSize: MainAxisSize.min ,
                children: [
                  Icon(widget.icon),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ) ,
            ),
            Text(
              widget.title ,
              style: TextStyle(
                color: widget.title_color ,
                fontSize: widget.title_size ,
                fontFamily: "Metrophobic" ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}