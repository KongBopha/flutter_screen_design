import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadimageWidget extends StatefulWidget {
  const UploadimageWidget({super.key});

  @override
  State<UploadimageWidget> createState() => _UploadimageWidgetState();
}

class _UploadimageWidgetState extends State<UploadimageWidget> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  Future<void>pickFromGallery()async{
    final XFile? pickFile = await _picker.pickImage(source: ImageSource.gallery);

    if(pickFile !=null){
      setState(() {
        _image = File(pickFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_image != null)
              Image.file(
                File(_image!.path),
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              )
        else
          Container(
          padding: EdgeInsets.all(12),
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ElevatedButtonTheme(
          data: ElevatedButtonThemeData(
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
              backgroundColor: WidgetStatePropertyAll(Colors.white),
            )
          ),
          child: ElevatedButton(
            onPressed: () {
              pickFromGallery();  
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.image_outlined,color: Colors.black,size: 30,),
                SizedBox(width: 8),
                Text("Upload Photo",style: TextStyle(color: Colors.black,fontSize: 14),),
              ],
            ),
          ),
        )
        ),
      ],
    );
  }
}