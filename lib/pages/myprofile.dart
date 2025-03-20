import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String username;
  final String profileImage;
  final List<Map<String, String>> posts;

  const ProfileScreen({
    required this.username,
    required this.profileImage,
    required this.posts,
  });

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String _updatedUsername;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _updatedUsername = widget.username; // Store the username locally
    _nameController.text = widget.username;
    _bioController.text = 'This is a sample bio.';
  }

  void _editProfile() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _bioController,
                decoration: InputDecoration(labelText: 'Bio'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _updatedUsername = _nameController.text; // Update the username locally
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_updatedUsername), // Display updated username
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.profileImage),
                  radius: 40,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.posts.length.toString(),
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('Posts'),
                        ],
                      ),
                      Column(
                        children: [
                          Text('1.2K', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('Followers'),
                        ],
                      ),
                      Column(
                        children: [
                          Text('500', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('Following'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _updatedUsername, // Show updated username
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'This is a sample bio. You can edit it by clicking the button below.',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _editProfile,
              child: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 40)),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: widget.posts.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  widget.posts[index]['postImage']!,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
