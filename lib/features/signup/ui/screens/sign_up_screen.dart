import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/fonts.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../login/ui/widgets/terms_and_conditions.dart';
import '../../logic/cubit/sign_up_cubit.dart';
import '../widgets/sign_up_form_field.dart';
import '../widgets/sign_up_listener_widget.dart';

import '../../../../core/theming/my_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: MyColors.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(70),
                const SignUpFormField(),
                verticalSpace(20),
                const TermsAndConditions(),
                verticalSpace(30),
                MyButton(
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.0, 1.0],
                    colors: [
                      MyColors.orangeColor,
                      MyColors.yellowColor,
                    ],
                  ),
                  onPressed: () {
                    validateThenSignUp(context);
                  },
                  child: Text(
                    'Sign Up',
                    style: FontHelper.font18BoldWhite,
                  ),
                ),
                const SignUpListenerWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  validateThenSignUp(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().signUp();
    }
  }
}
