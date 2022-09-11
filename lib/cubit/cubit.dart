import 'dart:io';
import 'package:as7app/cubit/states.dart';
import 'package:as7app/models/user_model.dart';
import 'package:as7app/modules/chats/chats_screen.dart';
import 'package:as7app/modules/feeds/feeds_screen.dart';
import 'package:as7app/modules/new_post/new_post_screen.dart';
import 'package:as7app/modules/settings/settings_screen.dart';
import 'package:as7app/modules/users/users_screen.dart';
import 'package:as7app/shared/components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


class SocialCubit extends Cubit<SocialStates>
{
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  SocialUserModel? userModel;

  var picker = ImagePicker();

  void getUserData()
  {
    emit(SocialGetUserLoadingState());
    
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
          //print(value.data());
          userModel = SocialUserModel.fromJson(value.data());
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
    NewPostScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];

  List<String> titles = [
    'Home',
    'Chats',
    'Post',
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

  File? profileImage;

  Future<void> getProfileImage() async
  {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if(pickedFile != null)
    {
      profileImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    }
    else
    {
      print('No Image Selected');
      emit(SocialProfileImagePickedErrorState());
    }
  }

  File? coverImage;

  Future<void> getCoverImage() async
  {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if(pickedFile != null)
    {
      coverImage = File(pickedFile.path);
      emit(SocialProfileCoverPickedSuccessState());
    }
    else
    {
      print('No Cover Selected');
      emit(SocialProfileCoverPickedErrorState());
    }
  }

  void uploadProfileImage()
  {
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value)
          {
            value.ref.getDownloadURL().then((value)
            {
              print(value);
            }).catchError((error){});
          })
        .catchError((error){});
  }
}