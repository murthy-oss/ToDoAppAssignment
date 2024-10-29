import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todolistapp/design/app_colors.dart';

class MyTextField extends StatefulWidget {
  
  final bool obscure;
  final bool selection;
  final FocusNode? focusNode;
  final TextEditingController controller;
final String hintText;
  final IconData? suffixIcon; 
  final IconData? prefixIcon;
  final autofillhints;
  final FormFieldValidator<String>? validator; 
  final TextInputType keyboardtype;
  final Color? fillcolor;
  const MyTextField({
    Key? key, 
    required this.obscure,
    required this.selection,
    this.focusNode,
    required this.controller,
    this.suffixIcon,
    this.validator,
    required this.keyboardtype,
    this.fillcolor, this.autofillhints, 
    required this.hintText, 
    this.prefixIcon,
  }) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    
      width: double.infinity,

      child: Padding(
        padding:  EdgeInsets.only(bottom: 20.h),
        child: AutofillGroup(
          child: TextFormField(
            spellCheckConfiguration: const SpellCheckConfiguration(),
          
              validator: widget.validator, 
              
              autofillHints: widget.autofillhints,
              obscureText: _obscureText,
              keyboardType: widget.keyboardtype,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  
                ),
                contentPadding: EdgeInsets.all(10.w),
               hintText: widget.hintText,
               filled: true,
               fillColor: Colors.white,
              
            
              
                suffixIcon: widget.suffixIcon != null
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(_obscureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      )
                    : null,
                    errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                                color:Colors.red),
     borderRadius: BorderRadius.circular(5.0.r),
     ), 
               enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(
                                color:AppColors.accentColor),
     borderRadius: BorderRadius.circular(5.0.r),
     ),
              ),
              controller: widget.controller,
              ),
        ),
      ),
    );
  }
}
