import 'package:as7app/cubit/cubit.dart';
import 'package:as7app/cubit/states.dart';
import 'package:as7app/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/styles/colors.dart';

class NewPostScreen extends StatelessWidget {

  var textController = TextEditingController();
  var now = DateTime.now();

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
              onPressed: ()
              {
                if(SocialCubit.get(context).postImage == null)
                {
                  SocialCubit.get(context).creatPost(
                      dateTime: now.toString(),
                      text: textController.text,);
                }
                else
                {
                  SocialCubit.get(context).uploadPostImage(
                      dateTime: now.toString(),
                      text: textController.text,
                  );
                }
              },
              child:
              Text('Post'),
            ),
          ],

        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              if(state is SocialCreatPostLoadingState)
                const LinearProgressIndicator(),
              if(state is SocialCreatPostLoadingState)
                SizedBox(height: 10.0,),
              Row(
                children: [
                  CircleAvatar(
                    radius: 18.0,
                    backgroundImage: NetworkImage(
                      '${SocialCubit.get(context).userModel!.image}',
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
                              '${SocialCubit.get(context).userModel!.name}',
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
                  controller: textController,
                  decoration: InputDecoration(
                      hintText: 'What is in your mind ',
                      border: InputBorder.none,
                  ),
                ),
              ),
              if(SocialCubit.get(context).postImage != null)
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children:
                  [
                    Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        image: DecorationImage(
                          image: FileImage(SocialCubit.get(context).postImage!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: ()
                      {
                        SocialCubit.get(context).removePostImage();
                      },
                      icon: CircleAvatar(
                        radius: 20.0,
                        child: Icon(
                          Icons.close,
                          size: 18.0,
                        ),
                      ),),

                  ]),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                        onPressed: ()
                        {
                          SocialCubit.get(context).getPostImage();
                        },
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
