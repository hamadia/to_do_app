import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/Features/account/data/user_dao.dart';

import 'model/task.dart';

class TaskDao {
  static CollectionReference<Task> getTasksCollection(String uid) {
    return UserDao.getUserCollection()
        .doc(uid)
        .collection(Task.collectionName)
        .withConverter(
            fromFirestore: (snapshot, options) =>
                Task.fromFireStore(snapshot.data()),
            toFirestore: (task, options) => task.toFireStore());
  }

  static Future<void> addTask(Task task, String uid) {
    var tasksCollection = getTasksCollection(uid);
    var docRef = tasksCollection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  static Future<List<Task>> getAllTasks(String uid) async {
    var tasksCollection = getTasksCollection(uid);
    var snapShot = await tasksCollection.get();
    return snapShot.docs.map((e) => e.data()).toList();
  }

  static Stream<List<Task>> listenForTasks(String uid, selectedDate) async* {
    var tasksCollection = getTasksCollection(uid);
    var stream = tasksCollection
        .where(
          'dateTime',
          isEqualTo: selectedDate,
        )
        .snapshots();
    yield* stream.map(
        (querySnapshot) => querySnapshot.docs.map((e) => e.data()).toList());
  }

  static Future<void> deleteTask(String uid, String taskId) {
    var tasksCollection = getTasksCollection(uid);
    return tasksCollection.doc(taskId).delete();
  }
}
