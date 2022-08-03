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
