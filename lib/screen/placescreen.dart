import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nativelocation/providers/user_places.dart';
import '../widget/listscreen.dart';
import 'addplace.dart';

class Placescreen extends ConsumerWidget {
  const Placescreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
 final myuserpalce=   ref.watch(UserPlaceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
       actions: [
        IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>Addplace()));
        }
            , icon: Icon(Icons.add))
       ],
      ),
      body: listscreen(places:myuserpalce,),
    );
  }
}
