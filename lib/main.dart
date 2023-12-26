import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vcard/providers/contact_provider.dart';
import 'package:vcard/pages/contact_details_page.dart';
import 'package:vcard/pages/form_page.dart';
import 'package:vcard/pages/home_page.dart';
import 'package:vcard/pages/scan_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ContactProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "V-Card",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        ScanPage.routeName: (context) => ScanPage(),
        FormPage.routeName: (context) => FormPage(),
        ContactDetailsPage.routeName: (context) => ContactDetailsPage()
      },
    );
  }
}
