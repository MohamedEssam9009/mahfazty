import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/networking/firebase_helper.dart';
import '../../../../core/theming/fonts.dart';
import '../../../../core/theming/my_colors.dart';
import '../../../../core/widgets/my_button.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked!;
        dateController.text = DateFormat('dd-MM-yyyy').format(selectedDate!);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Name',
                prefixIcon: Icon(Icons.abc),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
            ),
            verticalSpace(17),
            TextFormField(
              controller: priceController,
              decoration: const InputDecoration(
                hintText: 'Price',
                prefixIcon: Icon(Icons.price_change),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
            ),
            verticalSpace(17),
            TextFormField(
              controller: dateController,
              onTap: () {
                _selectDate(context);
              },
              readOnly: true,
              decoration: InputDecoration(
                hintText:
                    selectedDate != null ? selectedDate.toString() : 'Date',
                prefixIcon: const Icon(Icons.date_range),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
            ),
            verticalSpace(30),
            MyButton(
              gradient: const LinearGradient(
                colors: [
                  MyColors.orangeColor,
                  MyColors.yellowColor,
                ],
              ),
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    priceController.text.isNotEmpty &&
                    dateController.text.isNotEmpty) {
                  FirebaseHelper().addTransaction(
                    FirebaseAuth.instance.currentUser!.uid,
                    nameController.text,
                    priceController.text,
                    dateController.text,
                  );
                }
              },
              child: Text(
                'Save',
                style: FontHelper.font20BoldWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
