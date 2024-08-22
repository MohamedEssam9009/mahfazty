import 'package:flutter/material.dart';
import '../../../../core/helpers/spacing.dart';
import '../widgets/build_bloc_listener.dart';
import '../widgets/dont_have_an_account.dart';
import '../widgets/email_and_password.dart';
import '../widgets/terms_and_conditions.dart';

import '../../../../core/theming/my_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(150),
              const EmailAndPassword(),
              verticalSpace(10),
              const TermsAndConditions(),
              verticalSpace(20),
              const DontHaveAnAccount(),
              const BuildBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
