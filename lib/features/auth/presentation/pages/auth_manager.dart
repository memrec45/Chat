import 'package:chat_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:chat_app/features/home/presentation/pages/home_page.dart';
import 'package:chat_app/features/onBoarding/presentation/pages/on_boarding_page.dart';
import 'package:chat_app/injection_container.dart';
import 'package:chat_app/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthManager extends StatefulWidget {
  const AuthManager({super.key});

  @override
  State<AuthManager> createState() => _AuthManagerState();
}

class _AuthManagerState extends State<AuthManager> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            if (snapshot.data!.phoneNumber == null ||
                snapshot.data!.phoneNumber!.isEmpty) {
              return const OnBoarding();
            } else {
              return const HomePage();
            }
          } else {
            return const SignInPage();
          }
        }
        return const SizedBox();
      },
    );
  }
}
  // BlocConsumer<AuthBloc, AuthState>(
        //   bloc: sl<AuthBloc>(),
        //   listener: (context, state) {},
        //   builder: (context, state) {
        //     if (state is AuthSuccess) {
        //       final _auth = FirebaseAuth.instance.currentUser!;
        //       if (_auth.phoneNumber == null || _auth.phoneNumber!.isEmpty) {
        //         return const OnBoarding();
        //       } else {
        //         return const HomePage();
        //       }
        //     } else {
        //       return const SignInPage();
        //     }
        //   },
        // );