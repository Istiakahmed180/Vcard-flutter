import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vcard/models/contact_model.dart';
import 'package:vcard/providers/contact_provider.dart';

class FormPage extends StatefulWidget {
  static const String routeName = "/form";

  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final designationController = TextEditingController();
  final companyController = TextEditingController();
  final addressController = TextEditingController();
  final websiteController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    designationController.dispose();
    companyController.dispose();
    addressController.dispose();
    websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Contact"),
        actions: [
          IconButton(onPressed: _savedContact, icon: const Icon(Icons.save))
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: TextFormField(
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field must not be empty";
                  }
                  return null;
                },
                controller: nameController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Contact Name *"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field must not be empty";
                  }
                  return null;
                },
                controller: mobileController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.call), labelText: "Mobile Number *"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email), labelText: "Email Address"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: TextFormField(
                keyboardType: TextInputType.name,
                controller: companyController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.add_business_outlined),
                    labelText: "Company Name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: TextFormField(
                keyboardType: TextInputType.name,
                controller: designationController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.add_chart_outlined),
                    labelText: "Designation"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: TextFormField(
                keyboardType: TextInputType.streetAddress,
                controller: addressController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.location_city),
                    labelText: "Street Address"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: TextFormField(
                keyboardType: TextInputType.url,
                controller: websiteController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.web), labelText: "Website"),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _savedContact() {
    if (formKey.currentState!.validate()) {
      final contact = ContactModel(
          name: nameController.text,
          mobile: mobileController.text,
          email: emailController.text,
          company: companyController.text,
          designation: designationController.text,
          address: addressController.text,
          website: websiteController.text);

      Provider.of<ContactProvider>(context, listen: false)
          .insertContact(contact)
          .then((rowId) {
        if (rowId > 0) {
          Navigator.pop(context);
        }
      });
    }
  }
}
