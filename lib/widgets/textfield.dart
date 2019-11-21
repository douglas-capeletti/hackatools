import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String label;
  final String hint;
  final Function validator;
  final Function onSaved;
  final bool password;

  AppText(this.label, this.hint,
      {this.validator, this.onSaved, this.password = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: this.validator,
      onSaved: this.onSaved,
      obscureText: password,
      keyboardType: TextInputType.text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      decoration: InputDecoration(
          labelText: this.label,
          labelStyle: TextStyle(
              color: Colors.yellow, fontSize: 20, fontWeight: FontWeight.bold),
          hintText: this.hint,
          hintStyle: TextStyle(
            color: Colors.yellow,
            fontSize: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          errorStyle: TextStyle(fontSize: 20)),
    );
  }
}
