import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/custom_textfield_widget.dart';
import 'change_password_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  static const routName = 'Profile screen --> Edit profile screen';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:  const AppBarWidget(title: 'Edit Profile'),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(50),
          // Profile image
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: size.height / 8,
                height: size.height / 8,
                //margin: const EdgeInsets.only(left:45),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: Image.asset('assets/images/jonah.jpeg'),
                ),
              ),
              Positioned(
                child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.camera_enhance,
                    ),
                  ),
                ),
              ),
            ],
          ),

          //TODO: Gender radio button moonde !!!!!
          // TextFields
          const SizedBox(height: 50),
          CustomTextFieldWidget(
            controller: nameController,
            hintText: 'Name',
            prefixIcon: Icons.person,
            onChangeFunction: (value) {},
          ),
          const Gap(20),
          CustomTextFieldWidget(
            controller: usernameController,
            hintText: 'Username',
            prefixIcon: Icons.assignment_ind,
            onChangeFunction: (value) {},
          ),
          const Gap(20),
          CustomTextFieldWidget(
            controller: emailController,
            hintText: 'Email',
            prefixIcon: Icons.email,
            onChangeFunction: (value) {},
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 20),
            child: Row(
              children: [
               ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(ChangePasswordScreen.routeName);
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(
                        Size(size.width / 3, 40),
                      ),
                    ),
                    child: const Text(
                      'Change Password',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                  },
                  style: const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(
                      Size( double.nan,40),
                    ),
                  ),
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
