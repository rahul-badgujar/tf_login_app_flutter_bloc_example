import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_bloc/auth/email_password_login_postgres_impl.dart';
import 'package:login_page_bloc/auth_bloc/authstate_cubit.dart';
import 'package:login_page_bloc/screens/home/home_screen.dart';
import 'package:login_page_bloc/screens/login/login_screen.dart';

import 'package:tf_responsive/tf_responsive.dart';

import 'auth_bloc/auth_states.dart';
import 'resources/themes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TfResponsiveBuilder(
      builder: (context, deviceType, orientation) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: Themes.primaryLightTheme,
          debugShowCheckedModeBanner: false,
          home: BlocProvider(
            create: (context) => AuthStateCubit(
              loginService: EmailPasswordLoginPostgresImpl(),
            ),
            child: BlocBuilder<AuthStateCubit, AuthActionState>(
              buildWhen: ((previous, current) {
                final hasLoggedIn =
                    (current is AuthActionSuccessfull) && current != previous;
                final hasLoggedOut =
                    (previous is AuthActionSuccessfull) && current != previous;
                return hasLoggedIn || hasLoggedOut;
              }),
              builder: ((context, state) {
                if (state is AuthActionSuccessfull) {
                  // return auth only routes here
                  return const HomeScreen();
                } else {
                  // return login screen
                  return const LoginScreen();
                }
              }),
            ),
          ),
        );
      },
    );
  }
}
