import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app_clone/common/appbar/app_bar.dart';
import 'package:spotify_app_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_app_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_app_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_app_clone/data/models/auth/create_user_req.dart';
import 'package:spotify_app_clone/domain/usecases/auth/signup.dart';
import 'package:spotify_app_clone/presentation/auth/pages/signin.dart';
import 'package:spotify_app_clone/presentation/root/pages/root.dart';

import '../../../service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
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
              _registerText(),
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
              _fullNameField(context),
              const SizedBox(height: 20),
              _emailField(
                context,
              ),
              const SizedBox(height: 20),
              _passwordField(context),
              const SizedBox(height: 20),
              BasicAppButton(
                  onPressed: () async {
                    var result = await sl<SignupUseCase>().call(
                      params: CreateUserReq(
                        fullName: _fullName.text.toString(),
                        email: _email.text.toString(),
                        password: _password.text.toString(),
                      ),
                    );
                    result.fold(
                      (l) {
                        var snackBar = SnackBar(content: Text(l));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      (r) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const RootPage()),
                            (root) => false);
                      },
                    );
                  },
                  title: 'Create Account'),
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

  Widget _registerText() {
    return const Text(
      'Register',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameField(context) {
    return TextField(
      controller: _fullName,
      decoration: const InputDecoration(
        hintText: 'Full Name',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _emailField(context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
        hintText: 'Enter  Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(context) {
    return TextField(
      controller: _password,
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
            'Do you have an account?',
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
                        builder: (BuildContext context) => const SigninPage()));
              },
              child: const Text(
                'Sign In',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ))
        ],
      ),
    );
  }
}
