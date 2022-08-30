import 'package:as7app/cubit/states.dart';
import 'package:as7app/models/user_model.dart';
import 'package:as7app/modules/chats/chats_screen.dart';
import 'package:as7app/modules/feeds/feeds_screen.dart';
import 'package:as7app/modules/settings/settings_screen.dart';
import 'package:as7app/modules/users/users_screen.dart';
import 'package:as7app/shared/components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialCubit extends Cubit<SocialStates>
{
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  SocialUserModel? model;

  void getUserData()
  {
    emit(SocialGetUserLoadingState());
    
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
          //print(value.data());
          model = SocialUserModel.fromJson(value.data());
          emit(SocialGetUserSuccessState());
    })
        .catchError((error){
          print(error.toString());
          emit(SocialGetUserErrorState(error));
    });
  }

  int currentIndex = 0;

  List<Widget> screens = [
    FeedsScreen(),
    ChatsScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];

  List<String> titles = [
    'Home',
    'Chats',
    'Users',
    'Settings',
  ];

   void changeBottomNav(int index)
   {

     if(index == 2)
     {
       emit(SocialNewPostState());
     }
     else
     {
       currentIndex = index;
       emit(SocialChangeBottomNavState());
     }

   }
}