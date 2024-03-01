import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

showImageDialog(BuildContext context,{
  void Function()? onTapCamera,
  void Function()? onTapGallery,
}) async {
  if(!(await Permission.camera.request().isGranted)){
    openAppSettings();
    return ;
  }
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Pick image form"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                if(onTapCamera!=null)onTapCamera();
                Navigator.pop(context);
              },
              title: const Text("camera"),
              leading: const Icon(Icons.camera_alt),
            ),
            ListTile(
              onTap: () {
                if(onTapGallery!=null)onTapGallery();
                Navigator.pop(context);
              },
              title: const Text("Image"),
              leading: const Icon(Icons.image),
            ),
          ],
        ),
      );
    },
  );
}