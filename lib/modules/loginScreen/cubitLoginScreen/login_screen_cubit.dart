import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'login_screen_states.dart';


class SocialLoginCubit extends Cubit<SocialLoginStates> {
  SocialLoginCubit() : super(SocialLoginInitial());

  static SocialLoginCubit get(context) => BlocProvider.of(context);


  void userLogin({
    required String email,
    required String password
  }) {
    emit(SocialLoginLoading());

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value) 
    {
      print(value.user?.email);
      print(value.user?.uid);
      emit(SocialLoginSuccess());
    }).catchError((error)
    {
      emit(SocialLoginError(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(SocialChangePasswordVisibilityState());
  }
}
