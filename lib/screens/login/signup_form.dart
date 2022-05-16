import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_responsive/tf_responsive.dart';

import '../../bloc/auth_state_bloc/auth_states.dart';
import '../../bloc/auth_state_bloc/authstate_cubit.dart';
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
            child: BlocBuilder<AuthStateCubit, AuthState>(
              buildWhen: ((previous, current) {
                return current != previous;
              }),
              builder: ((context, state) {
                return CustomElevatedButton(
                  lable: "Register",
                  onPressed: () async {
                    await onRegisterPressed(context);
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onRegisterPressed(BuildContext context) async {
    final email = _emailTextEditingController.text.trim();
    final password = _passwordTextEditingController.text.trim();
    await context
        .read<AuthStateCubit>()
        .signupWithEmailPassword(email: email, password: password);
  }
}
