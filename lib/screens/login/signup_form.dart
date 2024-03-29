import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_bloc/bloc/auth_status/auth_status_bloc.dart';
import 'package:tf_responsive/tf_responsive.dart';
import '../../utils/util_funcs.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({Key? key}) : super(key: key);

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
          SizedBox(height: tfHeight(2.6)),
          Flexible(
            child: CustomTextField(
              controller: _passwordTextEditingController,
              hintText: "Confirm Password",
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
                  showMessageSnackbar(context, "Signed up successfully.");
                } else if (state is AuthOperationErrored) {
                  showMessageSnackbar(context, state.message);
                }
              },
              child: CustomElevatedButton(
                lable: "Register",
                onPressed: () {
                  onRegisterPressed(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onRegisterPressed(BuildContext context) {
    final email = _emailTextEditingController.text.trim();
    final password = _passwordTextEditingController.text.trim();
    context
        .read<AuthStatusBloc>()
        .add(SignupWithEmailPassword(email: email, password: password));
  }
}
