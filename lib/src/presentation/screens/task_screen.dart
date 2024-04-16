part of 'screens.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TextEditingController _taskController = TextEditingController();
  final taskBox = Hive.box('taskBox');
  TaskDatabase db = TaskDatabase();

  @override
  void initState() {
    if (taskBox.get('myTasks') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.taskList[index][1] = !db.taskList[index][1];
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.taskList.add([_taskController.text, false]);
      _taskController.clear();
    });
    Navigator.pop(context);
    db.updateData();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return CreateTaskDialogBox(
          controller: _taskController,
          onCancel: () => Navigator.pop(context),
          onSave: () => saveNewTask(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.taskList.removeAt(index);
    });
    Navigator.pop(context);
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kYellowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () => createNewTask(),
        child: Icon(
          Icons.add,
          color: kWhiteColor,
          size: 40,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              bottom: 80,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: db.taskList.length,
              itemBuilder: (context, index) {
                return TasksTile(
                  taskText: db.taskList[index][0],
                  isTaskComplete: db.taskList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DeleteDialog(
                            onCancel: () => Navigator.pop(context),
                            onDelete: () => deleteTask(index),
                          );
                        });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
