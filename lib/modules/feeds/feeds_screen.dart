import 'package:flutter/material.dart';

class FeedsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    return Column(
      children:
      [
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 20.0,
          margin: EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Image.network(
                'https://img.freepik.com/free-photo/group-friends-jumping-top-hill_273609-15304.jpg',
                fit: BoxFit.cover,
                height: 180.0,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Communicate With Your Friends',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white,)),
              ),
            ]
          ),
        ),
      ],
    );
  }
}
