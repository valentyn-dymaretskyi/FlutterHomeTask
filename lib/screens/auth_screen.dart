import 'package:flutter/material.dart';
import 'package:home_task/models/app_state.dart';
import 'package:home_task/app_state_container.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => new _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  AppState appState;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var container = AppStateContainer.of(context);
    appState = container.state;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.length < 3) {
                  return 'Minimum 3 characters required';
                }
                return null;
              },
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    appState.submittedText = _formKey.toString();
                  });
                  container.processToTheNextStep();
                }
              },
              child: Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }
}