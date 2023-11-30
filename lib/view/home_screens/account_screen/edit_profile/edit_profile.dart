import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/common_widgets/button_widget.dart';
import 'package:wizmo/res/common_widgets/text_field_widget.dart';
import 'package:wizmo/utils/camera_choice.dart';
import 'package:wizmo/view/home_screens/account_screen/edit_profile/edit_profile_provider.dart';
import 'package:wizmo/view/home_screens/account_screen/edit_profile/edit_profile_widget.dart';
import 'package:wizmo/view/login_signup/widgets/text_data.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<EditProfileProvider>(
              builder: (context, value, child) {
                return EditProfileWidget(
                    name: 'Charlie B',
                    onTap: () {
                      value.imagePicker(context: context, provider: value);
                    },
                    image:
                        'https://tse3.mm.bing.net/th?id=OIP.0l7k5zqRUVQ5Yq9eTpW2LgHaLJ&pid=Api&P=0&h=220',
                    location: 'London UK');
              },
            ),
            SizedBox(
              height: height * 0.02,
            ),
            TextData(text: 'Name'),
            Consumer<EditProfileProvider>(
              builder: (context, value, child) {
                return TextFieldWidget(
                  controller: value.nameController,
                  hintText: 'Usama Ahmad',
                  prefixIcon: Icons.person,
                  onTap: () {},
                  onChanged: (value) {
                    // return provider.test();
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
                );
              },
            ),
            SizedBox(
              height: height * 0.01,
            ),
            TextData(text: 'Email'),
            Consumer<EditProfileProvider>(
              builder: (context, value, child) => TextFieldWidget(
                controller: value.emailController,
                hintText: 'admin@gmail.com',
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
              height: height * 0.01,
            ),
            TextData(text: 'Phone'),
            Consumer<EditProfileProvider>(
              builder: (context, value, child) => TextFieldWidget(
                controller: value.phoneController,
                hintText: '+92 3113829383',
                prefixIcon: Icons.contacts,
                onTap: () {},
                onChanged: (value) {
                  // return provider.test();
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
            ),
            SizedBox(
              height: height * 0.01,
            ),
            TextData(text: 'Password'),
            Consumer<EditProfileProvider>(
              builder: (context, value, child) => TextFieldWidget(
                controller: value.passwordController,
                hintText: 'Password',
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility,
                hideIcon: Icons.visibility_off,
                obscure: value.obscure,
                onTap: () {},
                passTap: () {
                  value.passHide();
                },
                onChanged: (value) {
                  return null;
                },
                onValidate: (value) {
                  if (value.isEmpty) {
                    return "password field can't empty";
                  }
                  return null;
                },
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(height * 0.034),
                    borderSide: BorderSide(color: AppColors.white)),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Center(child: ButtonWidget(text: 'Update', onTap: () {})),
            SizedBox(
              height: height * 0.03,
            )
          ],
        ),
      ),
    );
  }
}
