import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogWithTextInput extends StatefulWidget {
  String title;
  String hint;

  DialogWithTextInput({this.title = 'HackaTools', this.hint = ''});

  @override
  _DialogWithTextInputState createState() => _DialogWithTextInputState();
}

class _DialogWithTextInputState extends State<DialogWithTextInput> with TickerProviderStateMixin {
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _displayDialog();
  }

  _displayDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(widget.title),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: widget.hint),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context, null);
                  _textFieldController.clear();
                },
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context, _textFieldController.text);
                  _textFieldController.clear();
                },
              ),
            ],
          ),
        );
      },
    );
  }

}
