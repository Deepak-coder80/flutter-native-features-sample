import 'package:app/providers/great_places.dart';
import 'package:app/screens/add_place_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Consumer<GratePlace>(
        child: const Center(
          child: Text('Got no places yet'),
        ),
        builder: (context, gratePlaces, child) => 
                // ignore: prefer_is_empty
                gratePlaces.items.length<=0?const Center(
          child: Text('Got no places yet'),
        ):ListView.builder(
          itemCount: gratePlaces.items.length,
          itemBuilder:(context, index) =>  ListTile(
            leading: CircleAvatar(backgroundImage: FileImage(gratePlaces.items[index].image),),
            title: Text(gratePlaces.items[index].title),
            onTap: (){},
          ),
        ),
      ),
    );
  }
}
