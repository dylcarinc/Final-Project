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
          // SizedBox(height: 10.0,),
          Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Total Expenditure: \$7,772,859"),
              ),
          Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("\$1,120,000 - Specific Instance"),
              ),
          Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("\$960,400 - Specific Instance"),
              ),
          Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("\$610,530 - Specific Instance")
              ),
        ])
  );
  }
}