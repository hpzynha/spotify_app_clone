import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app_clone/common/appbar/app_bar.dart';
import 'package:spotify_app_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_app_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_app_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_app_clone/presentation/auth/pages/signup.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
          title: SvgPicture.asset(
        AppVectors.logo,
        height: 40,
        width: 40,
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signinTextButton(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'If You Need Any Support',
                    style: TextStyle(
                      color: context.isDarkMode
                          ? const Color(0xffE1E1E1)
                          : const Color(0xff383838),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Click Here',
                      style: TextStyle(
                        color: Color(0xff38B432),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _usernameOrEmailField(context),
              const SizedBox(height: 20),
              _passwordField(context),
              Row(
                children: [
                  _recoveryPassword(),
                ],
              ),
              const SizedBox(height: 10),
              BasicAppButton(onPressed: () {}, title: 'Create Account'),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Or'),
                  ),
                  Expanded(child: Divider())
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppVectors.google,
                  ),
                  const SizedBox(width: 50),
                  SvgPicture.asset(
                    context.isDarkMode
                        ? AppVectors.appleDark
                        : AppVectors.apple,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _signinText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signinTextButton() {
    return const Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget _usernameOrEmailField(context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Enter Username Or Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not a Member?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignupPage()));
              },
              child: const Text(
                'Register Now',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ))
        ],
      ),
    );
  }

  Widget _recoveryPassword() {
    return TextButton(
        onPressed: () {},
        child: const Text(
          'Recovery Password',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ));
  }
}
