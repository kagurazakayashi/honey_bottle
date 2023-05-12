import 'dart:ffi';

import 'package:flutter/material.dart';
import 'myhomepage_widget.dart';

class MyHomePageState extends State<MyHomePage> {
  List<String> contacts = [];
  List<String> subContacts = [];
  List<bool> selected = [];
  bool switchValue = false;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      contacts.add('联系人$i');
      subContacts.add('联系人$i的描述');
      selected.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('选择收件人'),
        actions: <Widget>[
          Switch(
            value: switchValue,
            onChanged: (value) {
              setState(() {
                switchValue = value;
              });
            },
          ),
        ],
      ),
      body: contacts.isEmpty
          ? const Center(child: Text("没有联系人"))
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(contacts[index][0]),
                  ),
                  title: Text(contacts[index]),
                  subtitle: Text(subContacts[index]),
                  trailing: selected[index] ? const Icon(Icons.check) : null,
                  onTap: () {
                    setState(() {
                      for (int i = 0; i < selected.length; i++) {
                        selected[i] = i == index;
                        //   if (i == index) {
                        //     selected[i] = !selected[i];
                        //   } else {
                        //     selected[i] = false;
                        //   }
                      }
                    });
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
