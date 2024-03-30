import 'package:flutter/material.dart';
import 'package:shopping/constants.dart';

class CustomEditText extends StatefulWidget {
  final Function onSavedAction;
  final String title;
  final String hint;
  const CustomEditText({super.key, required this.onSavedAction, required this.title, required this.hint});

  @override
  _CustomEditTextState createState() => _CustomEditTextState(onSavedAction: onSavedAction, title: title, hint: hint);
}

class _CustomEditTextState extends State<CustomEditText> {

  final Function onSavedAction;
  final String title;
  final String hint;
  bool _obscureText = true;

  _CustomEditTextState({required this.onSavedAction, required this.title, required this.hint});

  void _toggle(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool isObscured() => title == "Password";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 25,
                color: greyTextColor
            ),
          ),
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty == true) {
              return "$title can't be empty";
            }
            switch(title) {
              case "E_mail" : {}
              case "Password" : {
                if (value.length < 7) return "Password must be > 6";
              }
              default : {}
            }
            return null;
          },
          onSaved: (value) {
            onSavedAction(value);
          },
          obscureText: (isObscured() && _obscureText),
          obscuringCharacter: '●',
          cursorColor: greyTextColor,
          decoration: InputDecoration(
              hintText: hint,
              // condition ? case1 : case2
              suffixIcon: isObscured() ? IconButton(
                onPressed: _toggle,
                icon: Icon(
                    _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined
                ),
              ) : null
          ),
        ),
      ],
    );
  }
}