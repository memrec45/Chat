import 'package:chat_app/core/extensions/context_extension.dart';
import 'package:chat_app/core/extensions/empty_padding.dart';
import 'package:chat_app/core/extensions/image_extension.dart';
import 'package:chat_app/core/utils/Buttons/responsive_button.dart';
import 'package:chat_app/core/utils/Buttons/text_button.dart';
import 'package:chat_app/core/utils/text%20fields/normal_text_field.dart';
import 'package:chat_app/core/utils/text%20fields/password_field.dart';
import 'package:chat_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:chat_app/features/auth/presentation/widgets/app_bar.dart';
import 'package:chat_app/features/auth/presentation/widgets/form.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/theme.dart';
import '../../../../logger.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = "/sign-up";
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? emailValidator(String? value) {
    if (EmailValidator.validate(value ?? "")) {
      return null;
    }
    return "Please provide a valid email address.";
  }

  String? passwordValidator(String? value) {
    if (value!.length >= 6) {
      return null;
    }
    return "Your password must be longer than 6 letters.";
  }

  @override
  Widget build(BuildContext context) {
    final Size size = context.screenSize;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AuthAppBar(
        text: "Sign Up",
      ),
      body: Center(
        child: SingleChildScrollView(
          child: AuthForm(
            formKey: _formKey,
            children: [
              /// Email field
              NormalTextField(
                labelText: "Email",
                controller: _nameController,
                hintText: "example@xxx.com",
                validator: emailValidator,
                textInputType: TextInputType.emailAddress,
              ),

              /// Spacing
              32.ph,

              /// Password Field
              PasswordField(
                label: const Text(
                  "Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.button,
                  ),
                ),
                validator: passwordValidator,
                controller: _passwordController,
              ),

              /// Spacing
              32.ph,

              /// Sign Up Button
              ResponsiveButton(
                screenSize: size,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    logger.i("message");
                  }
                },
                child: const Text("Sign Up"),
              ),

              /// Spacing
              32.ph,

              /// Already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account ? "),
                  ButtonText(
                      onTap: () => Navigator.of(context)
                          .pushReplacementNamed(SignInPage.routeName),
                      text: "Click here !")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}