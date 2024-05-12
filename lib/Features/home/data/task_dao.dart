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
}
