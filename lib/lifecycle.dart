import 'package:flutter/material.dart';

class AppLifecycleReactor extends StatefulWidget {
  const AppLifecycleReactor({required this.onStateChange, Key? key})
      : super(key: key);

  final ValueChanged<AppLifecycleState> onStateChange;

  @override
  State<AppLifecycleReactor> createState() => _AppLifecycleReactorState();
}

class _AppLifecycleReactorState extends State<AppLifecycleReactor>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    widget.onStateChange(state);
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
