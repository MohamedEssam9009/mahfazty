import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/routing/routes.dart';
import 'package:mahfazty/features/signup/logic/cubit/sign_up_cubit.dart';

class SignUpListenerWidget extends StatelessWidget {
  const SignUpListenerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignUpLoadingState ||
          current is SignUpErrorState ||
          current is SignUpSuccessState,
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is SignUpErrorState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error Signing Up'),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, Routes.home);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
