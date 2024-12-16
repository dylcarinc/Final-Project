import 'package:flutter/material.dart';
import 'dart:io';
import 'package:school_audit_navigator/main.dart';
import 'package:school_audit_navigator/audit_page.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}
class _FavoritesState extends State<Favorites> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 124, 175),
        title: const Text("School Audit Navigator"),
      ),
      body: FutureBuilder(future: getList(), 
      builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
               else{
                // reads data as a list of strings
                return ListView.builder(itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    if(snapshot.data[index].toString().isNotEmpty){
                    return ListTile(
                      // splits string of audit up into diferen pieces by special charachters
                      title: Text(snapshot.data[index].toString().substring(0,snapshot.data[index].toString().indexOf('-'))),
                      trailing: Text(snapshot.data[index].toString().substring(snapshot.data[index].toString().indexOf('-')+1,snapshot.data[index].toString().indexOf('!'))),
                      onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              // calls API to show audit
                              builder: (context) => AuditPage(
                                auditEIN:snapshot.data[index].toString().substring(snapshot.data[index].toString().indexOf('!')+1,snapshot.data[index].toString().indexOf('#')),
                                auditID: snapshot.data[index].toString().substring(snapshot.data[index].toString().indexOf('#')+1),
                                auditYear: snapshot.data[index].toString().substring(snapshot.data[index].toString().indexOf('-')+1,snapshot.data[index].toString().indexOf('!')),
                                auditName: snapshot.data[index].toString().substring(0,snapshot.data[index].toString().indexOf('-')),
                              ),
                    ));
                  }
                );}
               }); }}
       )
      );
}
}
