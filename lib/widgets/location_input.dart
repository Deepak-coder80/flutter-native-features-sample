import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  final String _previewImageUrl="";
  Future<void> _getCurrentUseLocation() async{
    final locData =await Location().getLocation();
    print(locData.latitude);
    print(locData.longitude);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          alignment: Alignment.center,
          width: double.infinity,
          child: _previewImageUrl == null
              ? const Text(
                  'No location choosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          children: [
            TextButton.icon(
              onPressed: _getCurrentUseLocation,
              icon: const Icon(Icons.map),
              label: const Text('select from map'),
            ),
            TextButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.location_on),
              label: const Text('Current location'),
            ),
          ],
        )
      ],
    );
  }
}
