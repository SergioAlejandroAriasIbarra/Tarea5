import 'package:flutter/material.dart';

class Pdetalle extends StatelessWidget {
  final String name;
  final String location;
  final String notes;
  final String check;
  //final List<Map<String, String>> data;
  const Pdetalle(
      {required this.name,
      required this.location,
      required this.notes,
      required this.check,
      //required this.data,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen

              // Título
              Text(
                name,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              Row(
                children: [
                  Icon(Icons.location_city),
                  Text(location),
                ],
              ),

              Row(
                children: [
                  Icon(Icons.calendar_month),
                  Text(check),
                ],
              ),

              Row(
                children: [
                  Icon(Icons.note),
                  Text(notes),
                ],
              ),
            ],
          ),
        ));
  }
}
