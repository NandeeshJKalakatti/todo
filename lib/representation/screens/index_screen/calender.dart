import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        title: const Text('Calender'),
        centerTitle: true,
       
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_left, color: Colors.white),
                Column(
                  children: [
                    Text(
                      'FEBRUARY',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '2022',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right, color: Colors.white),
              ],
            ),
          ),

          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(7, (index) {
                final days = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
                return Column(
                  children: [
                    Text(
                      days[index],
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: index == 3 ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        '${6 + index}',
                        style: TextStyle(
                          color: index == 3 ? Colors.white : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),

          SizedBox(height: 16),

    
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {},
                    child: Text('Today'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                    ),
                    onPressed: () {},
                    child: Text('Completed'),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          // Task List
          Expanded(
            child: ListView(
              children: [
                buildTaskItem('Do Math Homework', 'Today At 16:45', Colors.blue, 'University', 1),
                buildTaskItem('Tack out dogs', 'Today At 18:20', Colors.red, 'Home', 2),
                buildTaskItem('Business meeting with CEO', 'Today At 08:15', Colors.orange, 'Work', 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTaskItem(String title, String time, Color categoryColor, String category, int notificationCount) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          leading: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.grey,
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [
              Text(
                time,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(width: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: categoryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  category,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              Spacer(),
              Icon(Icons.notifications, color: Colors.grey, size: 16),
              SizedBox(width: 4),
              Text('$notificationCount', style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
