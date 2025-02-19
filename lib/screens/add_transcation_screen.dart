import 'package:finence_tracker/utitlies/app_theme.dart';
import 'package:finence_tracker/utitlies/validators.dart';
import 'package:finence_tracker/widget/add_transcation_button_widget.dart';
import 'package:finence_tracker/widget/add_transcation_navbar.dart';
import 'package:finence_tracker/widget/mtext_form_field.dart';
import 'package:flutter/material.dart';

class AddTranscationScreen extends StatelessWidget {
  const AddTranscationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppTheme.dark,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(28.0),
          child: Column(
            children: [
              SizedBox(
                height: 16.0,
              ),
              AddTranscationNavbar(),
              AddTranscationForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddTranscationForm extends StatefulWidget {
  const AddTranscationForm({
    super.key,
  });

  @override
  State<AddTranscationForm> createState() => _AddTranscationFormState();
}

class _AddTranscationFormState extends State<AddTranscationForm> {
  final GlobalKey<FormState> addTranscationFormKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();

  final TextEditingController _noteController = TextEditingController();

  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _dropdownValueController =
      TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    _categoryController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: addTranscationFormKey,
        child: Column(
          children: [
            const SizedBox(
              height: 22.0,
            ),
            MTextFormField(
              iconData: Icons.money,
              hintText: "Enter you amount",
              controller: _amountController,
              validator: Validators.validateAmount,
            ),
            MTextFormField(
              iconData: Icons.note,
              hintText: "Enter note",
              controller: _noteController,
              validator: Validators.validateString,
            ),
            MTextFormField(
              iconData: Icons.category,
              hintText: "Enter category",
              controller: _categoryController,
              validator: Validators.validateString,
            ),
            MDateFormField(
              iconData: Icons.date_range,
              hintText: DateTime.now().toString(),
              controller: _dateController,
              validator: Validators.validateString,
            ),
            MDropDownFormField(
              controller: _dropdownValueController,
              iconData: Icons.menu,
              validator: Validators.validateString,
            ),
            const AddTranscationButtonWidget(),
          ],
        ));
  }
}
