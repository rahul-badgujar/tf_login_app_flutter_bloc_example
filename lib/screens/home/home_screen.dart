import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_responsive/tf_responsive.dart';
import '../../bloc/auth_state_bloc/auth_states.dart';
import '../../bloc/auth_state_bloc/authstate_cubit.dart';
import '../../resources/colors.dart';
import '../../widgets/custom_elevated_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorPalette.primaryColor,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: tfWidth(4)),
                child: Column(
                  children: [
                    SizedBox(height: tfHeight(5)),
                    SizedBox(height: tfHeight(5)),
                    const Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: tfHeight(3)),
                    BlocBuilder<AuthStateCubit, AuthState>(
                      buildWhen: ((previous, current) {
                        return current != previous;
                      }),
                      builder: ((context, state) {
                        return CustomElevatedButton(
                            lable: "Logout",
                            onPressed: () async {
                              await onLogoutPressed(context);
                            });
                      }),
                    ),
                    SizedBox(height: tfHeight(5)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onLogoutPressed(BuildContext context) async {
    await context.read<AuthStateCubit>().logout();
  }
}
