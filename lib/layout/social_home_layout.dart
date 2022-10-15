import 'package:as7app/cubit/cubit.dart';
import 'package:as7app/cubit/states.dart';
import 'package:as7app/modules/loginScreen/login_screen.dart';
import 'package:as7app/modules/new_post/new_post_screen.dart';
import 'package:as7app/shared/components/components.dart';
import 'package:as7app/shared/styles/icon_broken.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if(state is SocialNewPostState)
        {
          navigateTo(context, NewPostScreen());
        }
      },
      builder: (context, state) {

        var cubit = SocialCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
            cubit.titles[cubit.currentIndex],
          ),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    FirebaseAuth.instance.signOut();
                    navigateTo(context, LoginScreen());
                  },
                  icon: Icon(
                    IconBroken.Logout,
                  )),
              IconButton(
                  onPressed: (){},
                  icon: Icon(
                    IconBroken.Notification,
                  )),
              IconButton(
                  onPressed: (){},
                  icon: Icon(
                    IconBroken.Search,
                  )),
            ],
        ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNav(index);
            },
            items:
            [
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                IconBroken.Home,
              )),
              BottomNavigationBarItem(
                  label: 'Chats',
                  icon: Icon(
                IconBroken.Chat,
              )),
              BottomNavigationBarItem(
                  label: 'Post',
                  icon: Icon(
                IconBroken.Paper_Upload,
              )),
              BottomNavigationBarItem(
                  label: 'Users',
                  icon: Icon(
                IconBroken.Location,
              )),
              BottomNavigationBarItem(
                  label: 'Settings',
                  icon: Icon(
                IconBroken.Setting,
              )),
            ],
          ),
        );
      },

    );
  }
}
