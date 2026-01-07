import 'package:flutter/material.dart';

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

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildShadowTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email
          _buildTitle("Email"),
          _buildShadowTextField(
            controller: emailController,
            hintText: "Enter your email",
          ),

          const SizedBox(height: 24),

          // Password
          _buildTitle("Password"),
          _buildShadowTextField(
            controller: passwordController,
            hintText: "Enter your password",
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
