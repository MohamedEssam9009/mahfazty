import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mahfazty/core/networking/firebase_helper.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final FirebaseHelper firebaseHelper;

  SignUpCubit(this.firebaseHelper) : super(SignUpInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  signUp() async {
    emit(SignUpLoadingState());
    try {
      await firebaseHelper
          .registerUser(
              emailController.text.trim(), passwordController.text.trim())
          .then((value) {
        emit(SignUpSuccessState());
      });
    } catch (e) {
      emit(SignUpErrorState());
    }
  }
}
