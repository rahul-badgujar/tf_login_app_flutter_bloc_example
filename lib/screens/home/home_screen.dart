import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_responsive/tf_responsive.dart';
import '../../auth_bloc/auth_states.dart';
import '../../auth_bloc/authstate_cubit.dart';
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
                    BlocBuilder<AuthStateCubit, AuthActionState>(
                      buildWhen: ((previous, current) {
                        if (current == previous) return false;
                        // build only when button changes to and fro disabled-enabled state
                        final loginInitiated = (current is AuthChangeInitiated);
                        final loginFinished = (previous is AuthChangeInitiated);
                        return loginInitiated || loginFinished;
                      }),
                      builder: ((context, state) {
                        return CustomElevatedButton(
                          lable: "Logout",
                          onPressed: (state is AuthActionSuccessfull)
                              ? () async {
                                  await onLogoutPressed(context);
                                }
                              : null,
                        );
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
