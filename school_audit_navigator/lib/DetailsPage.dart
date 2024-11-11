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
        backgroundColor: const Color.fromARGB(255, 76, 124, 175),
        centerTitle: true,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.0,),
          Text("Total Expenditure: \$7,772,859"),
          SizedBox(height: 20.0,),
          Text("\$1,120,000 - Specific Instance"),
          SizedBox(height: 10.0,),
          Text("\$960,400 - Specific Instance"),
          SizedBox(height: 10.0,),
          Text("\$610,530 - Specific Instance")
        ])
  );
  }
}