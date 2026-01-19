import 'package:flutter/material.dart';
import 'package:flutter_testing/presentation/views/widgets/variaint_option_widget.dart';

class CreateVariantScreen extends StatelessWidget {
  const CreateVariantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Create Option"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: const [
            SizedBox(height: 300),
            VariaintOptionWidget(),
          ],
        ),
      ),
    );
  }
}
