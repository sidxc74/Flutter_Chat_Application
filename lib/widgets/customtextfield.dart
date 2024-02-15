import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
   const CustomTextField({
    super.key, required this.hintText, required this.isPassword,  this.validator, required this.icon, required this.controller
  });

  final String hintText;
  final bool isPassword;
  final IconData icon;
  final String ? Function(String?)?validator;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showHidePassword =true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword && showHidePassword,
        validator: widget.validator ,
        decoration: InputDecoration(
          
          prefixIcon:  Icon(
            widget.icon,
            color : Colors.blue),
          suffix: widget.isPassword ? IconButton(icon: showHidePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),onPressed: () {
              
              setState(() {
                showHidePassword = !showHidePassword;
              }); 
          },) : SizedBox() ,
          hintText: widget.hintText,
          border : OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue, width : 2),
            ),
            errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width : 2),
            )
        ),
      ),
    );
  }
}