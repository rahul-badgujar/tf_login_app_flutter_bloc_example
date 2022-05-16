import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_bloc/auth/auth_service_postgres_impl.dart';
import 'package:login_page_bloc/bloc/auth_status/auth_status_bloc.dart';
import 'package:login_page_bloc/screens/home/home_screen.dart';
import 'package:login_page_bloc/screens/login/login_screen.dart';
import 'package:tf_responsive/tf_responsive.dart';
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
          home: BlocProvider<AuthStatusBloc>(
            // we are creating bloc here and adding initial event as to check if auth is persisted
            create: (context) => AuthStatusBloc(
              // TODO: provide the auth service impl of your choice from here
              authService: AuthServicePostgresImpl(),
            )..add(const PersistedAuthStatusCheck()),
            child: BlocBuilder<AuthStatusBloc, AuthStatusState>(
              buildWhen: (previous, current) => current != previous,
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
