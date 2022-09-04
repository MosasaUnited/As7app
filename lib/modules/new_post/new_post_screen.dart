import 'package:as7app/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';

class NewPostScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            IconBroken.Arrow___Left_2,
          ), onPressed: ()
            {
              Navigator.pop(context);
            },
        ),
        title: Text(
          'Add Post',
        ),

      ),

    );
  }
}
