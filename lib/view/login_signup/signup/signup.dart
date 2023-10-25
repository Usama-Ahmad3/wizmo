import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/main.dart';
import 'package:wizmo/res/common_widgets/button_widget.dart';
import 'package:wizmo/res/common_widgets/cashed_image.dart';
import 'package:wizmo/res/common_widgets/text_field_widget.dart';
import 'package:wizmo/utils/navigator_class.dart';
import 'package:wizmo/view/home_screens/main_bottom_bar/main_bottom_bar.dart';
import 'package:wizmo/view/login_signup/login/login.dart';
import 'package:wizmo/view/login_signup/signup/signup_provider.dart';
import 'package:wizmo/view/login_signup/widgets/text_data.dart';
import '../../../res/colors/app_colors.dart';

class SignUp extends StatefulWidget {
  SignUpProvider provider;
  SignUp({super.key, required this.provider});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpProvider get provider => widget.provider;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    print('In The Sign Up Screen');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              cachedNetworkImage(
                  cuisineImageUrl:
                      'https://tse4.mm.bing.net/th?id=OIP.ZnFdQZYW4Y7hrqtjsQYQRgHaEJ&pid=Api&P=0&h=220',
                  height: height * 0.4,
                  imageFit: BoxFit.fill,
                  errorFit: BoxFit.fill,
                  width: width),
              SizedBox(
                height: height * 0.015,
              ),
              Center(
                child: Text(
                  'Get started now with Wizmo',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.black),
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              TextData(text: 'Name'),
              TextFieldWidget(
                controller: provider.nameController,
                hintText: 'Enter Your Name',
                prefixIcon: Icons.person,
                onTap: () {},
                onChanged: (value) {
                  return provider.test();
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
              SizedBox(
                height: height * 0.01,
              ),
              TextData(text: 'Email'),
              TextFieldWidget(
                controller: provider.emailController,
                hintText: 'Enter Your Email',
                prefixIcon: Icons.email_outlined,
                onTap: () {},
                onChanged: (value) {
                  return provider.test();
                },
                onValidate: (value) {
                  if (value.isEmpty) {
                    return "email field can't be empty";
                  }
                  return null;
                },
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(height * 0.034),
                    borderSide: BorderSide(color: AppColors.white)),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              TextData(text: 'Password'),
              Consumer<SignUpProvider>(builder: (context, value, child) {
                return TextFieldWidget(
                  controller: value.passwordController,
                  hintText: 'Enter Your Password',
                  prefixIcon: Icons.lock_open,
                  suffixIcon: Icons.visibility,
                  hideIcon: Icons.visibility_off,
                  obscure: value.obscure,
                  passTap: () {
                    value.passHide();
                  },
                  onTap: () {},
                  onChanged: (value) {
                    return provider.test();
                  },
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return "password field can't be empty";
                    }
                    return null;
                  },
                  enableBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.035),
                      borderSide: BorderSide(color: AppColors.white)),
                  focusBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.034),
                      borderSide: BorderSide(color: AppColors.white)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.034),
                      borderSide: BorderSide(color: AppColors.white)),
                );
              }),
              SizedBox(
                height: height * 0.01,
              ),
              TextData(text: 'Contact'),
              TextFieldWidget(
                controller: provider.contactController,
                hintText: 'Enter Contact Number',
                prefixIcon: Icons.contacts,
                onTap: () {},
                onChanged: (value) {
                  return provider.test();
                },
                onValidate: (value) {
                  if (value.isEmpty) {
                    return "Contact field can't be empty";
                  }
                  return null;
                },
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(height * 0.034),
                    borderSide: BorderSide(color: AppColors.white)),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              TextData(text: 'License'),
              TextFieldWidget(
                controller: provider.licenseController,
                hintText: 'Enter Your License Number',
                prefixIcon: Icons.approval,
                onTap: () {},
                onChanged: (value) {
                  return provider.test();
                },
                onValidate: (value) {
                  if (value.isEmpty) {
                    return "License field can't be empty";
                  }
                  return null;
                },
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(height * 0.034),
                    borderSide: BorderSide(color: AppColors.white)),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              TextData(text: 'ID Card'),
              TextFieldWidget(
                controller: provider.idCardController,
                hintText: 'Enter Your ID Card Number',
                prefixIcon: Icons.info_outline,
                onTap: () {},
                onChanged: (value) {
                  return provider.test();
                },
                onValidate: (value) {
                  if (value.isEmpty) {
                    return "ID field can't be empty";
                  }
                  return null;
                },
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(height * 0.034),
                    borderSide: BorderSide(color: AppColors.white)),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              TextData(text: 'Date of Birth'),
              TextFieldWidget(
                controller: provider.dobController,
                hintText: 'Enter Your Date of Birth',
                prefixIcon: Icons.date_range,
                onTap: () {},
                onChanged: (value) {
                  return provider.test();
                },
                onValidate: (value) {
                  if (value.isEmpty) {
                    return "DOB field can't be empty";
                  }
                  return null;
                },
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(height * 0.034),
                    borderSide: BorderSide(color: AppColors.white)),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Container(
                      height: height * 0.15,
                      width: width * 0.5,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.shadowColor.withOpacity(0.2),
                                offset: const Offset(1, 1),
                                blurStyle: BlurStyle.normal,
                                blurRadius: 12,
                                spreadRadius: 3)
                          ],
                          borderRadius: BorderRadius.circular(height * 0.02)),
                      child: Consumer<SignUpProvider>(
                        builder: (context, value, child) {
                          return InkWell(
                            onTap: () {
                              context
                                  .read<SignUpProvider>()
                                  .imagePicker(ImageSource.gallery);
                            },
                            child: value.image != null
                                ? ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(height * 0.02),
                                    child: Image.file(
                                      value.image!.absolute,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : Icon(
                                    Icons.add,
                                    size: height * 0.09,
                                    color: AppColors.grey,
                                  ),
                          );
                        },
                      )),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Center(
                child: ButtonWidget(
                  text: 'Sign Up',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      print('Go HomeScreen');
                      navigateToHomeScreen();
                    }
                  },
                  loading: false,
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.09),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'By signing up you accept the',
                          style: Theme.of(context).textTheme.headline4),
                      TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: 'Terms of Services',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: AppColors.buttonColor)),
                      TextSpan(
                          text: '\nand ',
                          style: Theme.of(context).textTheme.headline4),
                      TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: 'Privacy Policy',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: AppColors.buttonColor))
                    ])),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have account? ",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    InkWell(
                      onTap: () {
                        navigateToSignin();
                      },
                      child: Text(
                        "LogIn",
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: AppColors.red),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }

  navigateToSignin() {
    NavigatorClass().navigatorPushReplacment(LogIn(provider: getIt()), context);
  }

  navigateToHomeScreen() {
    NavigatorClass()
        .navigatorPushReplacment(MainBottomBar(provider: getIt()), context);
  }
}
