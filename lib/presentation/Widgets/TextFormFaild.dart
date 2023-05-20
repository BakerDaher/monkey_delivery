import 'package:flutter/material.dart';

class TextFromFaild extends StatefulWidget {
  final String? Function(String? val)? function ;
  final TextInputType type ;
  late  bool obscureText ;
  final String label_text ;
  final String hint_text ;
  final TextEditingController text_controller ;

  TextFromFaild({
    required this.function ,
    required this.obscureText ,
    required this.type ,
    required this.label_text ,
    required this.hint_text ,
    required this.text_controller ,
    Key? key}) : super(key: key);

  @override
  State<TextFromFaild> createState() => _TextFromFaildState();
}

class _TextFromFaildState extends State<TextFromFaild> {
  bool view = false ;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 5),
          )
        ],
      ),
      height: 56,
      width: 307 ,
      alignment: Alignment.center,
      child: TextFormField(
        controller: widget.text_controller,
        keyboardType: widget.type ,
        // false >> show input or true >>> not show input
        obscureText: view ,
        validator: widget.function,
        decoration: InputDecoration(
          suffixIcon: widget.obscureText ? IconButton(
            onPressed: (){
              setState((){
                view = view ? false : true  ;
              }) ;
            },
            icon: Icon(
              view ? Icons.visibility_off : Icons.visibility,
              color:  Colors.black26 ,
            ) ,
          ) : null ,
          labelText: widget.label_text ,
          labelStyle: const TextStyle(
            color: Color(0xffB6B7B7) ,
            fontSize: 14 ,
            fontFamily: "Metrophobic" ,
          ),
          hintStyle: const TextStyle(
            color: Color(0xffB6B7B7) ,
            fontSize: 14 ,
            fontFamily: "Metrophobic" ,
          ),
          hintText: widget.hint_text ,
          //fillColor: Color(0xffF2F2F2) ,
          fillColor: Color(0xffF2F2F2) ,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(color: Colors.transparent)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(color: Colors.transparent)
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide:const BorderSide(color: Colors.red, width: 2.0)),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide:const BorderSide(color: Colors.red, width: 2.0)),
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        ),
      ),
    );
  }
}
