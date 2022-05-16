import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_bloc/auth_bloc/authstate_cubit.dart';
import 'package:tf_responsive/tf_responsive.dart';

import '../../auth_bloc/auth_states.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class SignInForm extends StatelessWidget {
  SignInForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Flexible(
            child: CustomTextField(
              controller: _emailTextEditingController,
              hintText: "Email Address",
            ),
          ),
          SizedBox(height: tfHeight(2.6)),
          Flexible(
            child: CustomTextField(
              controller: _passwordTextEditingController,
              hintText: "Password",
              obsecureText: true,
            ),
          ),
          SizedBox(height: tfHeight(3.3)),
          Flexible(
            child: BlocBuilder<AuthStateCubit, AuthActionState>(
              buildWhen: ((previous, current) {
                if (current == previous) return false;
                // build only when button changes to and fro disabled-enabled state
                final loginInitiated = (current is AuthChangeInitiated);
                final loginFinished = (previous is AuthChangeInitiated);
                return loginInitiated || loginFinished;
              }),
              builder: ((context, state) {
                return CustomElevatedButton(
                  lable: "Login",
                  onPressed: (state is AuthActionIdle)
                      ? () async {
                          await onLoginPressed(context);
                        }
                      : null,
                );
              }),
            ),
          ),
          SizedBox(height: tfHeight(2.6)),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: _buildForgotPasswordButton(),
          ),
        ],
      ),
    );
  }

  Future<void> onLoginPressed(BuildContext context) async {
    final email = _emailTextEditingController.text.trim();
    final password = _passwordTextEditingController.text.trim();
    await context
        .read<AuthStateCubit>()
        .login(email: email, password: password);
  }

  Widget _buildForgotPasswordButton() {
    return TextButton(
      onPressed: () {},
      child: Text(
        "Forgot Password?",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: tfText(2.2),
        ),
      ),
    );
  }
}
