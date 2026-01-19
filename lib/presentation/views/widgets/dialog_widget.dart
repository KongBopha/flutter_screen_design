import 'package:flutter/material.dart';
import 'package:flutter_testing/presentation/views/screens/createvariant%20_screen.dart';

class VariationDialog extends StatelessWidget {
  const VariationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/key.png",),fit: BoxFit.contain,height: 100,width: 100,),
            /// Title
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  const TextSpan(text: "Create Variation",
                      style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),),
                  const TextSpan(text: "\nAdd different options of your product, such as size, color, or style, to manage them easily.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ]
              ),
            ),
            const SizedBox(height: 16),

            /// Multiple Variation Button
            _DialogButton(
              title: "Multiple Variation",
              onTap: () {
                Navigator.pop(context, "multiple");
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CreateVariantScreen(),
                  ));
              },
            ),

            const SizedBox(height: 12),

            /// Single Variation Button
            _DialogButton(
              title: "Single Variation",
              onTap: () {
                Navigator.pop(context, "single");
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CreateVariantScreen(),
                  ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
/// Reusable dialog button
class _DialogButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _DialogButton({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.black12),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}