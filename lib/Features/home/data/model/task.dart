import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  static const collectionName = 'Tasks';
  String? id;
  String? title;
  String? description;
  bool isDone;
  Timestamp? dateTime;

  Task({
    this.id,
    this.title,
    this.description,
    this.isDone = false,
    this.dateTime,
  });

  Task.fromFireStore(Map<String, dynamic>? data)
      : this(
          id: data?['id'],
          title: data?['title'],
          description: data?['description'],
          isDone: data?['isDone'],
          dateTime: data?['dateTime'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
      'dateTime': dateTime,
    };
  }
}
