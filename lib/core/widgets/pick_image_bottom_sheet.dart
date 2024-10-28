import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void pickImageBottomSheet(
    {required BuildContext context,
    required Function(String source) onPressed}) {
  if (Platform.isIOS) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              // pickImg('Camera');
              onPressed('Camera');
              Navigator.of(context).pop();
            },
            child: const Text('Camera'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              // pickImg('Gallery');
              onPressed('Gallery');
              Navigator.of(context).pop();
            },
            child: const Text('Gallery'),
          ),
        ],
      ),
    );
  } else if (Platform.isAndroid) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt_outlined),
            title: const Text('Camera'),
            onTap: () {
              // pickImg('Camera');
              onPressed('Camera');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.collections),
            title: const Text('Gallery'),
            onTap: () {
              // pickImg('Gallery');
              onPressed('Gallery');
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

