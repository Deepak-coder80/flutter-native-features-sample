import 'package:flutter/material.dart';
import '../widgets/image_input.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';
import '../widgets/location_input.dart';
class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  static const routeName = '/add-place';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  TextEditingController _titleController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage){
    _pickedImage=pickedImage;
  }

  void _savePlace(){
    if(_titleController.text.isEmpty||_pickedImage==null){
       showDialog<String>(
        context: context,
        builder: ((context) => 
         AlertDialog(
          title:  const Text('title or image can\'t be null'),
          content:const  Text('please enter title and image'),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context,'OK');
            }, child: const Text('OK'),)
          ],
        )
        ),
      );
      return;
    }
    Provider.of<GratePlace>(context,listen: false)
          .addPlace(_titleController.text, _pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     ImageInput(onSelectImage: _selectImage,),
                     const SizedBox(height: 10,),
                     const LocationInput(),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Colors.black),
            onPressed: _savePlace,
            icon: const Icon(Icons.add),
            label: const Text('Add place'),
          )
        ],
      ),
    );
  }
}
