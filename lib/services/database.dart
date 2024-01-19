import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //collection reference
  CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  //get items
  Stream<QuerySnapshot> getNotes() {
    return notes.orderBy('created_at', descending: true).snapshots();
  }

  // add item
  Future<void> addNote(String note) async {
    await notes.add({
      'title': note,
      'created_at': Timestamp.now(),
    });
  }

  // update item
  Future<void> updateNote(String docId, String newNote) async {
    await notes.doc(docId).set(
        {'title': newNote, 'updated_at': Timestamp.now()},
        SetOptions(merge: true));
  }

  // delete item
  Future<void> deleteNote(String docId) async {
    await notes.doc(docId).delete();
  }
}
