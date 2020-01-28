import 'package:home_task/app.dart';
import 'package:home_task/app_state_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new AppStateContainer(
    child: new AppRootWidget(),
  ));
}