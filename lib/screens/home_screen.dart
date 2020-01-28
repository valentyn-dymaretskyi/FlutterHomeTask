import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_task/models/app_state.dart';
import 'package:home_task/app_state_container.dart';
import 'auth_screen.dart';
import 'map_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  AppState appState;

  Widget get _pageToDisplay {
    if (appState.isLoading) {
      return _loadingView;
    } else if (!appState.isLoading && appState.submittedText == null) {
      return AuthScreen();
    } else {
      return MapScreen();
    }
  }

  Widget get _loadingView {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var container = AppStateContainer.of(context);
    appState = container.state;
    Widget body = _pageToDisplay;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Task'),
      ),
      body: body,
    );
  }
}