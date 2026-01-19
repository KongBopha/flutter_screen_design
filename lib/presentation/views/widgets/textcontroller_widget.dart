import 'package:flutter/material.dart';
import 'package:flutter_testing/presentation/views/widgets/fieldtitle_widget.dart';
import 'package:flutter_testing/presentation/views/widgets/shadowtextfield_widget.dart';

class TextcontrollerWidget extends StatefulWidget {
  const TextcontrollerWidget({super.key});

  @override
  State<TextcontrollerWidget> createState() => _TextcontrollerWidgetState();
}

class _TextcontrollerWidgetState extends State<TextcontrollerWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email
          const FieldTitle("Email"),
          ShadowTextField(
            controller: emailController,
            hintText: "Enter your email",
          ),

          const SizedBox(height: 24),

          // Password
          const FieldTitle("Password"),
          ShadowTextField(
            controller: passwordController,
            hintText: "Enter your password",
            obscureText: true,
          ),
        ],
      ),
    );
  }
}


