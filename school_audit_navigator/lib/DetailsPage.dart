import 'package:flutter/material.dart';

//placeholder details page
class Detailspage extends StatefulWidget {
  const Detailspage({super.key});

  @override
  State<Detailspage> createState() => _DetailsPageState();
}


class _DetailsPageState extends State<Detailspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: const Text('Federal Spending on'),
        centerTitle: true,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total Expenditure:")
        ])
  );
  }
}