import 'package:flutter/material.dart';
import 'package:tareaprov/provider.dart';
import 'package:provider/provider.dart';

class Pageadd extends StatelessWidget {
  const Pageadd({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final locationController = TextEditingController();
    final noteController = TextEditingController();
    bool checkbox = false;
    return Scaffold(
      appBar: AppBar(
        title: Text('Forage add'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Location',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Checkbox(
                  value: context.watch<LogicalProvider>().value,
                  onChanged: (value) {
                    context.read<LogicalProvider>().valueOfCheckB();
                  },
                ),
                Text('Currently in season'),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: noteController,
              decoration: InputDecoration(
                labelText: 'Notes',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<LogicalProvider>().addDatatoList(
                        nameController.text,
                        locationController.text,
                        noteController.text,
                        checkbox);
                    context.read<LogicalProvider>().clearCheckB();
                    Navigator.pop(context);
                  },
                  child: Text('SAVE'),
                ),
                ElevatedButton(
                  onPressed: () {
                    nameController.clear();
                    locationController.clear();
                    noteController.clear();
                    context.read<LogicalProvider>().clearCheckB();
                  },
                  child: Text('DELETE'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
