import 'package:flutter/material.dart';

class SocialLoginButtons extends StatefulWidget {
  final VoidCallback onGoogleTap;
  final VoidCallback onFacebookTap;
  final VoidCallback onAppleTap;

  const SocialLoginButtons({
    super.key,
    required this.onGoogleTap,
    required this.onFacebookTap,
    required this.onAppleTap,
  });

  @override
  State<SocialLoginButtons> createState() => _SocialLoginButtonsState();
}

class _SocialLoginButtonsState extends State<SocialLoginButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        _imageButton(
          imagePath: 'assets/images/google.png',
          onTap: widget.onGoogleTap,
        ),

        const SizedBox(width: 20),

        _imageButton(
          imagePath: 'assets/images/facebook.png',
          onTap: widget.onFacebookTap,
        ),

        const SizedBox(width: 20),

        _iconButton(
          icon: Icons.apple,
          onTap: widget.onAppleTap,
        ),
      ],
    );
  }

  // 🔹 Google & Facebook (PNG)
  Widget _imageButton({
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40),
      child: Container(
        
        height: 50,
        width: 50,
        decoration: BoxDecoration(
        
          border: Border.all(color: Colors.grey),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            height: 60,
            width: 60,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  // 🔹 Apple (Icon)
  Widget _iconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.black, size: 40,),
      ),
    );
  }
}
