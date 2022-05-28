import 'package:as7app/modules/registerScreen/cubitRegisterScreen/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitial());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);


  // void userRegister({
  //   required String email,
  //   required String name,
  //   required String phone,
  //   required String password
  // }) {
  //   emit(SocialRegisterLoading());
  //
  //   DioHelper.postData(
  //     url: '',
  //     data: {
  //       'email': email,
  //       'name': name,
  //       'phone': phone,
  //       'password': password,
  //     },
  //   ).then((value) {
  //     print(value.data);
  //
  //
  //     emit(SocialRegisterSuccess());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(SocialRegisterError(error.toString()));
  //   });
  // }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(SocialChangeRegisterPasswordVisibilityState());
  }
}
