import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tcda_app/reusable_widgets/notifications/add_task.dart';
import 'package:tcda_app/reusable_widgets/notifications/button.dart';
import 'package:tcda_app/reusable_widgets/notifications/controllers/task_controller.dart';
import 'package:tcda_app/reusable_widgets/notifications/models/task.dart';
import 'package:tcda_app/reusable_widgets/notifications/services/notification_services.dart';
import 'package:tcda_app/reusable_widgets/notifications/task_tile.dart';
import 'package:tcda_app/reusable_widgets/notifications/theme.dart';
import 'package:tcda_app/reusable_widgets/notifications/theme_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());

  var notifyHelper;
  @override
  void initState() {
    super.initState();

    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          SizedBox(
            height: 10,
          ),
          _showTasks(),
        ],
      ),
    );
  }

  _showTasks() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
            itemCount: _taskController.taskList.length,
            itemBuilder: (_, index) {
              Task task = _taskController.taskList[index];

              print(task.toJson());
              if (task.repeat == 'Daily') {
                DateTime date =
                    DateFormat('HH:mm').parse(task.startTime.toString());
                var myTime = DateFormat('HH:mm').format(date);
                notifyHelper.scheduledNotification(
                    int.parse(myTime.toString().split(":")[0]),
                    int.parse(myTime.toString().split(":")[1]),
                    task);
                return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _showBottomSheet(context, task);
                              },
                              child: TaskTile(task),
                            )
                          ],
                        ),
                      ),
                    ));
              }
              if (task.date == DateFormat.yMd().format(_selectedDate)) {
                return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _showBottomSheet(context, task);
                              },
                              child: TaskTile(task),
                            )
                          ],
                        ),
                      ),
                    ));
              } else {
                return Container();
              }
            });
      }),
    );
  }

  _showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: task.isCompleted == 1
            ? MediaQuery.of(context).size.height * 0.24
            : MediaQuery.of(context).size.height * 0.32,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.grey),
            ),
            Spacer(),
            task.isCompleted == 1
                ? Container()
                : _bottoSheetButton(
                    label: 'Completed',
                    onTap: () {
                      _taskController.markTaskCompleted(task.id!);
                      Get.back();
                    },
                    clr: primaryClr,
                    context: context,
                  ),
            SizedBox(
              height: 20,
            ),
            _bottoSheetButton(
              label: 'Delete Task',
              onTap: () {
                _taskController.delete(task);

                Get.back();
              },
              clr: Colors.red[300]!,
              context: context,
            ),
            SizedBox(
              height: 20,
            ),
            _bottoSheetButton(
              label: ' Close',
              onTap: () {
                _taskController.delete(task);
                _taskController.getTasks();
                Get.back();
              },
              clr: Colors.red[300]!,
              isClose: true,
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  _bottoSheetButton(
      {required String label,
      required Function()? onTap,
      required Color clr,
      bool isClose = false,
      required BuildContext context}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: isClose == true
                  ? const Color.fromARGB(255, 202, 201, 201)
                  : clr),
          borderRadius: BorderRadius.circular(20),
          color: isClose == true ? Colors.transparent : clr,
        ),
        child: Center(
          child: Text(
            label,
            style:
                isClose ? titleStyle : titleStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        left: 20,
      ),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 64,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        selectedTextColor: Colors.white,
        dateTextStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 105, 105, 105)),
        dayTextStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 105, 105, 105)),
        monthTextStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 105, 105, 105)),
        onDateChange: (date) {
          setState(() {
            _selectedDate = date;
          });
        },
      ),
    );
  }

  _addTaskBar() {
    return Container(
      margin: EdgeInsets.only(left: 4, right: 5, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
                Text(
                  "Today",
                  style: headingStyle,
                )
              ],
            ),
          ),
          MyButton(
              label: "+Reminder",
              onTap: () async {
                await Get.to(() => (AddTaskPage()));
                _taskController.getTasks();
              })
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      toolbarHeight: 48,
      elevation: 0,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {
          // ignore: avoid_print
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
              title: "Theme Changed",
              body: Get.isDarkMode
                  ? "Activiated Light Theme"
                  : "Activated Dark Theme");
          //notifyHelper.scheduledNotification();
        },
        child: const Icon(
          Icons.nightlight_round,
          color: Colors.black,
          size: 24,
        ),
      ),
      actions: [
        Icon(
          Icons.person_sharp,
          color: Colors.black,
          size: 30,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:reminder/controllers/task_controller.dart';

// class TaskListView extends StatelessWidget {
//   // final TaskController taskController = Get.put();
//   final taskController = Get.put(TaskController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Task List'),
//       ),
//       body: Obx(
//         () {
//           if (taskController.taskList.isEmpty) {
//             return Center(
//               child: Text('No tasks available.'),
//             );
//           } else {
//             return ListView.builder(
//               itemCount: taskController.taskList.length,
//               itemBuilder: (_, context) {
//                 print(taskController.taskList.length);
//                 Container(
//                   height: 100,
//                   width: 520,
//                   color: Colors.amber,
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
