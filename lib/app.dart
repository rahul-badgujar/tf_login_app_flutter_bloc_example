import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_bloc/auth/auth_service_postgres_impl.dart';
import 'package:login_page_bloc/bloc/auth_state_bloc/auth_states.dart';
import 'package:login_page_bloc/screens/home/home_screen.dart';
import 'package:login_page_bloc/screens/login/login_screen.dart';

import 'package:tf_responsive/tf_responsive.dart';
import 'bloc/auth_state_bloc/authstate_cubit.dart';
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
          home: BlocProvider<AuthStateCubit>(
            create: (context) => AuthStateCubit(
              // providing auth service here.
              authService: AuthServicePostgresImpl(),
            ),
            child: BlocBuilder<AuthStateCubit, AuthState>(
              builder: (context, state) {
                // if not authenticated, show login screen
                if (state is NotAuthenticated) {
                  return const LoginScreen();
                }
                // handle rest navigation routes here
                return const HomeScreen();
              },
            ),
          ),
        );
      },
    );
  }
}
