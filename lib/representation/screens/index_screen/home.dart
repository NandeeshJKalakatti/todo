import 'dart:math';
import 'package:flutter/material.dart';
import '../../../models/api_model.dart';
import '../../../service/api_service.dart';
import '../../widget/app_loader.dart';
import '../../widget/button_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading = false;
  List<todolist> postlist = [];
  List<Map<String, dynamic>> tasks = []; 
  String? selectedId; 

  @override
  void initState() {
    super.initState();
    selectedId = '1'; 
    getData(); 
  }

  getData() async {
    setState(() {
      loading = true;
    });

    try {
      postlist = await AdminService.instance.getlist(context);

      if (selectedId != null && postlist.isNotEmpty) {
        final selectedTasks = await AdminService.instance.gettodolist(context, selectedId!);

        final Random random = Random();
        tasks = selectedTasks.map((post) {
          return {
            'title': post.title ?? 'No Title',
            'category': ['University', 'Home', 'Work', 'Completed'][random.nextInt(4)], 
            'color': Color(random.nextInt(0xFFFFFF) + 0xFF000000),
            'completed': random.nextBool(),
            'priority': random.nextInt(5) + 1,
          };
        }).toList();
      }
    } catch (e) {
      print('Error fetching data: $e');
    }

    setState(() {
      loading = false;
    });
  }

  Future<void> onRefresh() async => getData();

  @override
  Widget build(BuildContext context) {
    final uniqueUserIds = postlist
        .map((post) => post.userId)
        .toSet() 
        .where((userId) => userId != null) 
        .map((userId) => userId.toString()) 
        .toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.filter_list_outlined),
          onPressed: () {},
        ),
        title: const Text('Index'),
        centerTitle: true,
        actions: [
          Image.asset(
            'images/image.png',
            width: 35,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: AppLoader(
        loading: loading,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search for your task...',
                    filled: true,
                    fillColor: Colors.grey[900],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              if (uniqueUserIds.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DropdownCardWidget(
                        selectedId: selectedId,
                        uniqueUserIds: uniqueUserIds,
                        onChanged: (value) {
                          setState(() {
                            selectedId = value;
                          });
                          getData();
                        },
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: postlist.isNotEmpty
                    ? ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          final task = tasks[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            color: Colors.grey[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: Checkbox(
                                value: task['completed'],
                                onChanged: (_) => toggleTaskCompletion(index),
                                activeColor: task['color'],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              title: Text(
                                task['title'],
                                style: TextStyle(
                                  decoration: task['completed'] ? TextDecoration.lineThrough : null,
                                  color: Colors.white,
                                ),
                              ),
                              trailing: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: task['color'],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  task['category'],
                                  style: const TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              Image.asset(
                                'images/Checklist.png',
                                width: 300,
                                height: 300,
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'No posts available.',
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Please refresh or try again later.',
                                style: TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              const Text(
                                'Add the task by clicking + button',
                                style: TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  void toggleTaskCompletion(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
      tasks.sort((a, b) => a['completed'] ? 1 : -1);
    });
  }
}
