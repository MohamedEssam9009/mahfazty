import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../networking/firebase_helper.dart';
import 'routes.dart';
import '../../features/home/ui/screens/home_screen.dart';
import '../../features/home/ui/widgets/add_transaction_screen.dart';
import '../../features/login/logic/cubit/login_cubit.dart';
import '../../features/login/ui/screens/login_screen.dart';
import '../../features/signup/logic/cubit/sign_up_cubit.dart';
import '../../features/signup/ui/screens/sign_up_screen.dart';
import '../../features/transactions/ui/screens/transactions_screen.dart';

class Routing {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(FirebaseHelper()),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignUpCubit(FirebaseHelper()),
            child: const SignUpScreen(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.chart:
        return MaterialPageRoute(
          builder: (context) => const TransactionsScreen(),
        );
        case Routes.transaction:
        return MaterialPageRoute(
          builder: (context) => const AddTransactionScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NoRouteScreen(),
        );
    }
  }
}

class NoRouteScreen extends StatelessWidget {
  const NoRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No route found'),
      ),
    );
  }
}
