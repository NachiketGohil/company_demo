import 'package:flutter/material.dart';

import 'screen/companies_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Companies App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CompaniesListScreen(),
    );
  }
}
