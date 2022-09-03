import 'package:as7app/models/user_model.dart';
import 'package:as7app/modules/registerScreen/cubitRegisterScreen/register_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitial());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);


  void userRegister({
    required String email,
    required String name,
    required String phone,
    required String password
  })
  {
    emit(SocialRegisterLoading());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value)
    {
      print(value.user?.email);
      print(value.user?.uid);
      userCreat(
          email: email,
          name: name,
          phone: phone,
          uId: value.user!.uid,
      );
    }).catchError((error)
    {
      emit(SocialRegisterError(error.toString()));
    });
  }

  void userCreat({
    required String email,
    required String name,
    required String phone,
    required String uId,

})
  {
    SocialUserModel model = SocialUserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      image: 'https://img.freepik.com/free-photo/asian-woman-posing-looking-camera_23-2148255359.jpg?w=826&t=st=1662006717~exp=1662007317~hmac=319931f409bacb182602abf83429f018d38eb9ef7378651fc77e7b426cd113c6',
      cover: 'https://img.freepik.com/free-photo/group-friends-jumping-top-hill_273609-15304.jpg',
      bio: 'writ your bio ...',
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
          emit(SocialCreatUserSuccess());
    })
        .catchError((error) {
          emit(SocialCreatUserError(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(SocialChangeRegisterPasswordVisibilityState());
  }
}
