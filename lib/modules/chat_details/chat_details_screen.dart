import 'package:as7app/cubit/cubit.dart';
import 'package:as7app/cubit/states.dart';
import 'package:as7app/models/user_model.dart';
import 'package:as7app/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/message_model.dart';

class ChatDetailsScreen extends StatelessWidget
{
  SocialUserModel? userModel;

  ChatDetailsScreen({
   this.userModel
  });

  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context)
      {
        SocialCubit.get(context).getMessages(receiverId: userModel!.uId!);

        return BlocConsumer<SocialCubit, SocialStates>(
          listener: (context, state){},
          builder: (context, state) => Scaffold(
            appBar: AppBar(
              titleSpacing: 0.0,
              title: Row(
                children:
                [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                      userModel!.image!,
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    userModel!.name!,
                    style: TextStyle
                      (
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
            body: ConditionalBuilder(
              condition: SocialCubit.get(context).messages.isNotEmpty,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index)
                          {
                            var messages = SocialCubit.get(context).messages[index];

                            if(SocialCubit.get(context).userModel!.uId == messages.senderId)
                            {
                              return buildMyMessage(messages);
                            }
                            else
                            {
                              return buildMessage(messages);
                            }
                          },
                          separatorBuilder: (context, index) => SizedBox(
                            height: 10.0,
                          ),
                          itemCount: SocialCubit.get(context).messages.length,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children:
                          [
                            Expanded(
                              child: TextFormField(
                                controller: messageController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'type your message here',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: ()
                                    {
                                    },
                                    icon: Transform.translate(
                                      offset: const Offset(10, 0),
                                      child: Icon(
                                        Icons.broken_image,
                                        color: Colors.blue,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0.0,
                                  ),
                                  IconButton(
                                    onPressed: ()
                                    {
                                      SocialCubit.get(context).sendMessage(
                                        receiverId: userModel!.uId!,
                                        dateTime: DateTime.now().toString(),
                                        text: messageController.text,
                                      );
                                    },
                                    icon: Transform.translate(
                                      offset: const Offset(10, 0),
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.blue,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          ),
        );
      },
    );
  }

  Widget buildMessage(MessageModel model) => Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(10.0),
          topStart:Radius.circular(10.0),
          topEnd: Radius.circular(10.0),
        ),
      ),
      padding:EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: Text(
        model.text!,
      ),
    ),
  );

  Widget buildMyMessage(MessageModel model) => Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
      decoration: BoxDecoration(
        color: defaultColor.withOpacity(.5),
        borderRadius: BorderRadiusDirectional.only(
          bottomStart: Radius.circular(10.0),
          topStart:Radius.circular(10.0),
          topEnd: Radius.circular(10.0),
        ),
      ),
      padding:EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: Text(
        model.text!,
      ),
    ),
  );
}
