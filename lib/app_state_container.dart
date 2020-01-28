import 'package:home_task/models/app_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppStateContainer extends StatefulWidget {
  final AppState state;
  final Widget child;

  AppStateContainer({
    @required this.child,
    this.state,
  });

  static _AppStateContainerState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_InheritedStateContainer>())
        .data;
  }

  @override
  _AppStateContainerState createState() => _AppStateContainerState();
}

class _AppStateContainerState extends State<AppStateContainer> {
  AppState state;

  @override
  void initState() {
    super.initState();
    if (widget.state != null) {
      state = widget.state;
    } else {
      state = AppState.loading();
      _onLoading();
    }
  }

  void  processToTheNextStep() {
    setState(() {
      state.isLoading = true;
    });
    _onLoading();
  }

  void _onLoading() {
    Future.delayed(Duration(seconds: 2), ()
    {
      setState(() {
        state.isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final _AppStateContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}