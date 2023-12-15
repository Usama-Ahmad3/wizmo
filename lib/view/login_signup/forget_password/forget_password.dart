import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/res/app_urls/app_urls.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/common_widgets/button_widget.dart';
import 'package:wizmo/res/common_widgets/text_field_widget.dart';
import 'package:wizmo/view/login_signup/forget_password/forget_password_provider.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Forget Password'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * .08,
              ),
              Text(
                'Enter Your Email',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.08, vertical: height * 0.01),
                child: Text(
                  'Enter Your Registered Email To Reset Your Password',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(
                height: height * .1,
              ),
              Consumer<ForgetPasswordProvider>(
                builder: (context, value, child) => TextFieldWidget(
                  controller: value.emailController,
                  hintText: 'Email',
                  prefixIcon: Icons.person,
                  onTap: () {},
                  onChanged: (value) {
                    return null;
                  },
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return "email field can't empty";
                    }
                    return null;
                  },
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.034),
                      borderSide: BorderSide(color: AppColors.white)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .06,
              ),
              Consumer<ForgetPasswordProvider>(
                builder: (context, value, child) => ButtonWidget(
                  text: 'Send',
                  onTap: () async {
                    Map detail = {'email': value.emailController.text};
                    value.forgetPassword(
                        detail, "${AppUrls.baseUrl}${AppUrls.forget}", context);
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Consumer<ForgetPasswordProvider>(
                    builder: (context, value, child) => GestureDetector(
                        onTap: () {
                          value.navigateToSignup(context);
                        },
                        child: Text(
                          "Signup",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: AppColors.red),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
