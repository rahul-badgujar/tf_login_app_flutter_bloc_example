import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_bloc/bloc/auth_status/auth_status_bloc.dart';
import 'package:login_page_bloc/utils/util_funcs.dart';
import 'package:tf_responsive/tf_responsive.dart';
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
            child: BlocListener<AuthStatusBloc, AuthStatusState>(
              listenWhen: ((previous, current) {
                return current != previous;
              }),
              listener: (context, state) {
                if (state is Authenticated) {
                  showMessageSnackbar(context, "Logged in successfully.");
                } else if (state is AuthOperationErrored) {
                  showMessageSnackbar(context, state.message);
                }
              },
              child: CustomElevatedButton(
                lable: "Login",
                onPressed: () {
                  onLoginPressed(context);
                },
              ),
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

  void onLoginPressed(BuildContext context) {
    final email = _emailTextEditingController.text.trim();
    final password = _passwordTextEditingController.text.trim();
    context
        .read<AuthStatusBloc>()
        .add(LoginWithEmailPassword(email: email, password: password));
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
