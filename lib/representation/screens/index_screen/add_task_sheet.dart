import 'package:flutter/material.dart';
import '../../../service/api_service.dart';
import '../../../static/app_styles.dart';

class AddTaskSheet extends StatefulWidget {
  const AddTaskSheet({Key? key}) : super(key: key);

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  bool loading = false;
  final formKey = GlobalKey<FormState>();

  final TextEditingController _taskController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  _submitTask() async {
    loading = true;
    setState(() {});
    if (formKey.currentState!.validate()) {
      String? id = 1.toString();
      String acc_number = _taskController.text;
      loading = true;
      setState(() {});
      bool result = await AdminService.instance.postexpence(
        context,
        id,
        acc_number,
      );
      loading = false;
      setState(() {});
      if (result) {
        Navigator.pop(context, true);
      }
    }

    loading = false;
    setState(() {});
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(data: ThemeData.dark(), child: child!);
      },
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _pickTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(data: ThemeData.dark(), child: child!);
      },
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  Future<void> _submit() async {
    final String task = _taskController.text;
    if (task.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all the details.')),
      );
      return;
    }

    // Prepare data to send to the API
    final DateTime fullDateTime = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    final Map<String, dynamic> taskData = {
      'task': task,
      'dateTime': fullDateTime.toIso8601String(),
    };

    // Simulating API call
    print('Sending to API: $taskData');

    // Example: Use Dio or http package to send the API request here
    // await Dio().post('https://your-api-url.com/tasks', data: taskData);

    // On success
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text("Add Task", style: AppStyle.btn1),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                hintText: "Add a task...",
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.timer_outlined, color: Colors.white),
                  onPressed: _pickDate,
                ),
                IconButton(
                  icon: const Icon(Icons.alarm_outlined, color: Colors.white),
                  onPressed: _pickTime,
                ),
                const Icon(Icons.flag_outlined, color: Colors.white),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.send_outlined, color: Colors.blue),
                  onPressed: _submitTask,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showAddTaskSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.grey[900],
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return const AddTaskSheet();
    },
  );
}
