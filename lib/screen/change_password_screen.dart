import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:workout/widgets/app_bar_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);


  static const routeName = '/Change Password screen';

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  Widget _buildTextField(
      String title,
      TextEditingController controller,
      // double height,
      ) {
    return SizedBox(
      // height: height,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xff2e2e2e),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(10),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Provide a value';
            }
            return null;
          },
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
          cursorColor: Colors.yellow,
          textAlign: TextAlign.start,
          textAlignVertical: const TextAlignVertical(y: -1),
          decoration: InputDecoration(
            //hintText: 'Plan Name',
            filled: true,
            fillColor: Colors.black12,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Colors.transparent, style: BorderStyle.none, width: 0),
            ),
            hintStyle: const TextStyle(
              color: Color(0xfffafafa),
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            suffixIconColor: const Color(0xfff1f123),
            prefixIconColor: const Color(0xfff1f123),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Colors.transparent, style: BorderStyle.none, width: 0),
            ),
            disabledBorder: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Colors.transparent, style: BorderStyle.none, width: 0),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Change Password',),
      body: Padding(
        padding: const EdgeInsets.only(left:25,right: 25,top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTextField('Current Password', _currentPasswordController),
            const Gap(10),
            _buildTextField('New Password', _newPasswordController),
            const Gap(10),

            //TODO: edit confirm password : just compare
            _buildTextField('Confirm New Password', _newPasswordController),
            const Gap(30),
            ElevatedButton(onPressed: (){}, child: const Text('Save'),),
          ],
        ),
      ),
    );
  }
}
