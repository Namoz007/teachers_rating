import 'package:flutter/material.dart';

class UniversalField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData fieldIcon;
  bool isPassword;
  bool isEmail;

  UniversalField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.fieldIcon,
    required this.isPassword,
    required this.isEmail,
  });

  @override
  State<UniversalField> createState() => _UniversalFieldState();
}

class _UniversalFieldState extends State<UniversalField> {

  late bool _showText;

  @override
  void initState() {
    super.initState();
    _showText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        if(value != null && value.trim().isNotEmpty){
          if(widget.isEmail){
            if(!value.contains('@')){
              return "Email format not correct!";
            }
          }else if(widget.isPassword){
            if(value.length < 6){
              return "Password min length 6!";
            }

          }
        }else{
          return "${widget.hintText} must not be empty!";
        }

        return null;
      },
      obscureText: _showText,
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: widget.hintText,
        prefixIcon: Icon(widget.fieldIcon),
        suffixIcon: widget.isPassword ? GestureDetector(
          onTap: (){
            setState(() {
              _showText = !_showText;
            });
          },
          child: Icon(_showText ? Icons.visibility_sharp : Icons.visibility_off),
        ) : const SizedBox(),
      ),
    );
  }
}
