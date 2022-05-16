import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_bloc/bloc/auth_status/auth_status_bloc.dart';
import 'package:tf_responsive/tf_responsive.dart';
import '../../resources/colors.dart';
import '../../utils/util_funcs.dart';
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
                    BlocListener<AuthStatusBloc, AuthStatusState>(
                      listenWhen: ((previous, current) {
                        return current != previous;
                      }),
                      listener: (context, state) {
                        if (state is Authenticated) {
                          showMessageSnackbar(
                              context, "Logged out successfully.");
                        }
                      },
                      child: CustomElevatedButton(
                        lable: "Logout",
                        onPressed: () async {
                          onLogoutPressed(context);
                        },
                      ),
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

  void onLogoutPressed(BuildContext context) {
    context.read<AuthStatusBloc>().add(const Logout());
  }
}
