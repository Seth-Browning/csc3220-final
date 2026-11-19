// -----------------------------------------------------------------------
// Filename: screen_alternative.dart
// Original Author: Dan Grissom
// Creation Date: 10/31/2024
// Copyright: (c) 2024 CSC322
// Description: This file contains the screen for a dummy alternative screen
//               history screen.

//////////////////////////////////////////////////////////////////////////
// Imports
//////////////////////////////////////////////////////////////////////////

// Flutter imports
import 'dart:async';

// Flutter external package imports
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

// App relative file imports
import '../../util/message_display/snackbar.dart';

//////////////////////////////////////////////////////////////////////////
// StateFUL widget which manages state. Simply initializes the state object.
//////////////////////////////////////////////////////////////////////////
class ScreenAlternate extends ConsumerStatefulWidget {
  static const routeName = '/alternative';

  @override
  ConsumerState<ScreenAlternate> createState() => _ScreenAlternateState();
}

//////////////////////////////////////////////////////////////////////////
// The actual STATE which is managed by the above widget.
//////////////////////////////////////////////////////////////////////////
class _ScreenAlternateState extends ConsumerState<ScreenAlternate> {
  // The "instance variables" managed in this state
  bool _isInit = true;

  ////////////////////////////////////////////////////////////////
  // Runs the following code once upon initialization
  ////////////////////////////////////////////////////////////////
  @override
  void didChangeDependencies() {
    // If first time running this code, update provider settings
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

  ////////////////////////////////////////////////////////////////
  // Initializes state variables and resources
  ////////////////////////////////////////////////////////////////
  Future<void> _init() async {}

  //////////////////////////////////////////////////////////////////////////
  // Primary Flutter method overridden which describes the layout and bindings for this widget.
  //////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    // Return the scaffold
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: ShapeBorder.lerp(CircleBorder(), StadiumBorder(), 0.5),
        onPressed: () => Snackbar.show(
          SnackbarDisplayType.SB_INFO,
          'You clicked the floating button on the alternate screen!',
          context,
        ),
        splashColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          verticalDirection: VerticalDirection.down,
          mainAxisAlignment: .start,
          crossAxisAlignment: .stretch,
          spacing: 4,
          children: [
            Text(
              'Choose what sounds good. We\'ll combine duplicates and sort the ingredients into your list.',
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                mainAxisAlignment: .spaceBetween,
                spacing: 4,
                children: [
                  Card(child: Text('M')),
                  Card(child: Text('Tu')),
                  Card(child: Text('W')),
                  Card(child: Text('Th')),
                  Card(child: Text('F')),
                  Card(child: Text('Sa')),
                  Card(child: Text('Su')),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text('This week\'s dinners.'),
                  TextButton(onPressed: () {}, child: Text('Browse All')),
                ],
              ),
            ),
            Expanded(flex: 4, child: Text('Meal list')),
            ElevatedButton(
              child: Text('Add # ingredients'),
              onPressed: () {
                Snackbar.show(
                  SnackbarDisplayType.SB_INFO,
                  'You have clicked to add meal ingredients',
                  context,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
