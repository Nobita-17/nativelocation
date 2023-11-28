import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/user_places.dart';
import '../widget/location_input.dart';
import 'image_input.dart';

class Addplace extends ConsumerStatefulWidget {
  const Addplace({Key? key}) : super(key: key);

  @override
  _AddplaceState createState() => _AddplaceState();
}

class _AddplaceState extends ConsumerState<Addplace> {
  final _titleController = TextEditingController();
  File? myselectedimage ;

  void saveplace() {
    final enterText = _titleController.text;
    if (enterText.isEmpty || myselectedimage==null) {
      return;
    }
    ref.read(UserPlaceProvider.notifier).addPlace(myselectedimage!,enterText);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Places'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            SizedBox(height: 20),
            ImageInput(mypickimage: (File image) {
              myselectedimage=image;
            },),
            SizedBox(height: 20),
            LocationInput(),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: saveplace,
              label: Text('Click to Add'),
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
