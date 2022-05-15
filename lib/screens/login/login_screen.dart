import 'package:flutter/material.dart';
import 'package:tf_responsive/tf_responsive.dart';
import '../../resources/colors.dart';

import 'signin_form.dart';
import 'signup_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                    _buildAuthTabsContent(context),
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

  Widget _buildAuthTabsContent(BuildContext context) {
    return Column(
      children: [
        _buildTabTitles(context),
        SizedBox(height: tfHeight(4.2)),
        _buildTabItems(context),
      ],
    );
  }

  Widget _buildTabTitles(BuildContext context) {
    // Builder to build Tab Title Item
    Widget _tabTitleItemBuilder(String lableText) => Tab(
          child: Text(
            "     $lableText     ",
            style: TextStyle(
              fontSize: tfText(2.8),
            ),
          ),
        );

    return TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      tabs: [
        _tabTitleItemBuilder(
          "Sign In",
        ),
        _tabTitleItemBuilder(
          "Sign Up",
        ),
      ],
    );
  }

  Widget _buildTabItems(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: tfHeight(40)),
      child: TabBarView(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: tfWidth(5)),
          child: SignInForm(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: tfWidth(5)),
          child: SignUpForm(),
        ),
      ]),
    );
  }
}
