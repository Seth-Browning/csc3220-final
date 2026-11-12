
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenRepeats extends ConsumerStatefulWidget {
  static const routeName = '/repeats';
  
  @override
  ConsumerState<ScreenRepeats> createState() => _ScreenRepeatsState();
}

class _ScreenRepeatsState extends ConsumerState<ScreenRepeats> {
  bool _isInit = true;

  @override
  void didChangeDependencies() {

    if (_isInit) {
      _init();
      _isInit = false;
    }

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> _init() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.repeat_rounded),
              title: Text('Never run out of essentials'),
              subtitle: Text('Repeats join the right trip automatically, customized for your needs'),
            ),
          )
        ],
      ),
    );
  }
}