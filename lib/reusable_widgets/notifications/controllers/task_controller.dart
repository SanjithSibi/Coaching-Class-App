import 'package:get/get.dart';
import 'package:tcda_app/reusable_widgets/notifications/db/db_helper.dart';
import 'package:tcda_app/reusable_widgets/notifications/models/task.dart';
// import 'package:reminder/db/db_helper.dart';
// import 'package:reminder/models/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    // When the controller is ready, fetch the tasks
    getTasks();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  // Get all the data from the table and update the taskList
  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();

    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

  void delete(Task task) {
    DBHelper.delete(task);
    getTasks();
  }

  void markTaskCompleted(int id) async {
    await DBHelper.update(id);
    getTasks();
  }
}
