import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DatabaseService databaseService = DatabaseService();
  final TextEditingController _noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Things I Am Grateful For'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          openDialogBox();
        },
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: databaseService.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List notesList = snapshot.data.docs;
            return ListView.builder(
              itemBuilder: (context, index) {
                DocumentSnapshot document = notesList[index];
                String docId = document.id;
                Map<String, dynamic> note = document.data();
                return Column(
                  children: [
                    ListTile(
                      title: Text(note['title']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              _noteController.text = note['title'];
                              setState(() {});
                              openDialogBox(
                                docId: docId,
                              );
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.green,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await databaseService.deleteNote(docId);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    )
                  ],
                );
              },
              itemCount: notesList.length,
            );
          } else {
            return const Text('No notes found');
          }
        },
      ),
    );
  }

  //open dialod box
  void openDialogBox({String docId}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Note *'),
        content: TextField(
          controller: _noteController,
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              if (_noteController.text.isEmpty) {
                return;
              }
              if (docId == null) {
                //add item to notes collection in firebase
                await databaseService.addNote(_noteController.text);
              } else {
                //add item to notes collection in firebase
                await databaseService.updateNote(docId, _noteController.text);
              }
              _noteController.clear();
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            child: Text('Submit'),
          )
        ],
      ),
    );
  }
}
