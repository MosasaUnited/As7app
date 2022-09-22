import 'package:as7app/cubit/cubit.dart';
import 'package:as7app/cubit/states.dart';
import 'package:as7app/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/styles/colors.dart';

class NewPostScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) =>
          Scaffold(
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
            'Creat Post',
          ),
          actions:
          [
            TextButton(
              onPressed: (){},
              child:
              Text('Post'),
            ),
          ],

        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 18.0,
                    backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/pretty-glad-brunette-asian-woman-stands-half-turned-against-pink-wall-has-good-mood-wears-stylish-jacket-with-hood-thinks-about-something-pleasant-poses-happy-indoor-emotions-concept_273609-49492.jpg?w=1380&t=st=1660793864~exp=1660794464~hmac=a76308a68e849637c76eaa0d2fd7c5ea81c36ceb6d6c0bee146c0f72b488237e',
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Mostafa Saad',
                              style: TextStyle(
                                height: 1.3,
                              ),
                            ),
                            Icon(
                              Icons.check_circle,
                              color: defaultColor,
                              size: 14.0,)
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'What is in your mind ',
                      border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              IconBroken.Image,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text('Add Photo'),
                          ],
                        ),),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: (){},
                      child: Text(
                        'tags#'
                      ),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),

      )
    );
  }
}
