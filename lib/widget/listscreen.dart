import 'package:flutter/material.dart';
import 'package:nativelocation/model/place.dart';

import '../screen/placedetail.dart';

class listscreen extends StatelessWidget {
  const listscreen({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text('no places added'),
      );
    }
    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index) => ListTile(
              title: Text(
                places[index].title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>PlaceDetailScreen(place: places[index],)));
          },
            ));
  }
}
