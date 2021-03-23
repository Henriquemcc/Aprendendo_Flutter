import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Transferências'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            Card(
                child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text("R\$ 1000.00"),
              subtitle: Text("37890"),
            )),
            Card(
                child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text("R\$ 800.00"),
              subtitle: Text("379990"),
            ))
          ],
        ),
      ),
    ));
