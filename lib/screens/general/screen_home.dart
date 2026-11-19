// -----------------------------------------------------------------------
// Filename: screen_home.dart
// Original Author: Dan Grissom
// Creation Date: 10/31/2024
// Copyright: (c) 2024 CSC322
// Description: This file contains the screen for a dummy home screen
//               history screen.

//////////////////////////////////////////////////////////////////////////
// Imports
//////////////////////////////////////////////////////////////////////////

// Flutter imports
import 'dart:async';
import 'dart:math';

// Flutter external package imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc322_starter_app/db_helpers/items.dart';
import 'package:csc322_starter_app/widgets/navigation/widget_app_drawer.dart';
import 'package:csc322_starter_app/widgets/navigation/widget_primary_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

// App relative file imports
import '../../util/message_display/snackbar.dart';

//////////////////////////////////////////////////////////////////////////
// StateFUL widget which manages state. Simply initializes the state object.
//////////////////////////////////////////////////////////////////////////
class ScreenHome extends ConsumerStatefulWidget {
  static const routeName = '/home';

  @override
  ConsumerState<ScreenHome> createState() => _ScreenHomeState();
}

//////////////////////////////////////////////////////////////////////////
// The actual STATE which is managed by the above widget.
//////////////////////////////////////////////////////////////////////////
class _ScreenHomeState extends ConsumerState<ScreenHome> {
  // The "instance variables" managed in this state
  bool _isInit = true;

  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();

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
          'You clicked the floating button on the home screen!',
          context,
        ),
        splashColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          verticalDirection: VerticalDirection.down,
          mainAxisAlignment: .start,
          crossAxisAlignment: .stretch,
          spacing: 4,
          children: [
            IntrinsicHeight(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text('Saturday Morning'),
                      Text(
                        '6 of 15 complete',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      child: ListTile(
                        title: Text('Meals'),
                        onTap: () {
                          ref
                              .read(providerPrimaryBottomNavTabIndex.notifier)
                              .selectTab(
                                BottomNavSelection.ALTERNATE_SCREEN.index,
                              );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: ListTile(
                        title: Text('Repeats'),
                        onTap: () {
                          ref
                              .read(providerPrimaryBottomNavTabIndex.notifier)
                              .selectTab(
                                BottomNavSelection.REPEATS_SCREEN.index,
                              );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: _searchController,
                  textInputAction: .search,
                  decoration: InputDecoration(
                    hintText: 'Search this list...',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.add),
                  ),
                  onChanged: (val) {
                    print(val);
                  },
                  validator: (val) {},
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  final random = Random();
                  addGroceryItem('Item-${random.nextInt(pow(2, 30).toInt())}', random.nextInt(26), '#');
                },
                child: Text('Add Random item'),
              ),
            ),
            Expanded(
              flex: 4,
              child: StreamBuilder<QuerySnapshot>(
                stream: groceryStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }
              
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  
                  final items = snapshot.data!.docs;
              
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      //print('Data: ${items[index].data()}');
                      final item = items[index].data() as Map<String, dynamic>;
                  
                      return ListTile(
                        title: Text(item['name']),
                        subtitle: Text('${item['quantity']} ${item['unit']}'),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
