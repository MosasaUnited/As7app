import 'package:as7app/cubit/cubit.dart';
import 'package:as7app/cubit/states.dart';
import 'package:as7app/models/user_model.dart';
import 'package:as7app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDetailsScreen extends StatelessWidget
{
  SocialUserModel? userModel;

  ChatDetailsScreen({
   this.userModel
  });

  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              buildMessage(),
              buildMyMessage(),
              Spacer(),
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
                        child: IconButton(
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMessage() => Align(
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
        'Hello World',
      ),
    ),
  );

  Widget buildMyMessage() => Align(
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
        'Hello World',
      ),
    ),
  );
}
