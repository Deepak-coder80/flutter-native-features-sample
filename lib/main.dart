import 'package:app/providers/great_places.dart';
import 'package:app/screens/add_place_screen.dart';
import 'package:app/screens/place_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GratePlace(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Great Places',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo).copyWith(secondary: Colors.amber),
        ),
        home: const PlaceListScreen(),
        routes: {
          AddPlaceScreen.routeName:((context) => const AddPlaceScreen())
        },
      ),
    );
  }
}

