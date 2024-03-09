import 'package:flutter/material.dart';
import 'package:tareaprov/pageadd.dart';
import 'package:provider/provider.dart';
import 'package:tareaprov/pdetalle.dart';
import 'provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (_) => LogicalProvider(),
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Forage',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        // useMaterial3: true,
        primarySwatch: Colors.deepPurple,
      ),
      // A widget which will be started on application startup
      home: MyHomePage(title: 'Forage'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // The title text which will be shown on the action bar
          title: Text(title),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: context.watch<LogicalProvider>().listDatos.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Pdetalle(
                                name: context
                                    .watch<LogicalProvider>()
                                    .listDatos[index]["name"],
                                location: context
                                    .watch<LogicalProvider>()
                                    .listDatos[index]["location"],
                                check: context
                                    .watch<LogicalProvider>()
                                    .listDatos[index]["checkbox"],
                                notes: context
                                    .watch<LogicalProvider>()
                                    .listDatos[index]["notes"],
                              )),
                    );
                    //print(context.watch<LogicalProvider>().listDatos[index].);
                    print("HOLA");
                  },
                  child: ListTileWidget(
                      title: context.watch<LogicalProvider>().listDatos[index]
                          ["name"]!,
                      subtitle: context
                          .watch<LogicalProvider>()
                          .listDatos[index]["location"]!),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Pageadd()),
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30.0,
          ),
        ));
  }
}

class ListTileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const ListTileWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: isSelected ? Colors.lightBlueAccent : Colors.transparent,
      child: ListTile(
        //leading: Image.asset(asset),
        title: Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
