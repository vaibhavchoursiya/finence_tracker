import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:finence_tracker/widget/registeration_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterationScreen extends StatelessWidget {
  const RegisterationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.dark,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.22,
              ),
              const Icon(
                Icons.handshake,
                color: AppTheme.light,
                size: 64.0,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                "Register",
                style: GoogleFonts.aDLaMDisplay(
                  color: AppTheme.light,
                  fontSize: 32.0,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const RegisterationFormWidget()
            ],
          ),
        ),
      ),
    );
  }
}
