import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/profileimg.png'),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Martha Hays',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TaskCard(
                    title: '10 Task left',
                  ),
                  TaskCard(
                    title: '5 Task done',
                  ),
                ],
              ),
              SizedBox(height: 32),
              OptionTile(icon: Icons.settings_outlined, title: 'App Settings'),
              OptionTile(icon: Icons.person_outlined, title: 'Change account name'),
              OptionTile(icon: Icons.lock_outlined, title: 'Change account password'),
              OptionTile(icon: Icons.camera_alt_outlined, title: 'Change account Image'),
              SizedBox(height: 16),
              OptionTile(icon: Icons.info_outlined, title: 'About US'),
              OptionTile(icon: Icons.question_answer_outlined, title: 'FAQ'),
              OptionTile(icon: Icons.feedback_outlined, title: 'Help & Feedback'),
              OptionTile(icon: Icons.support_outlined, title: 'Support US'),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Handle logout functionality
                },
                child: Text(
                  'Log out',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;

  TaskCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final IconData icon;
  final String title;

  OptionTile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      onTap: () {},
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
    );
  }
}
