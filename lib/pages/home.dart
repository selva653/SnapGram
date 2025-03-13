import 'package:flutter/material.dart';

void main() {
  runApp(InstagramCloneApp());
}

class InstagramCloneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnapGram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: InstagramHomePage(),
    );
  }
}

class InstagramHomePage extends StatelessWidget {
  // Dummy data for posts
  final List<Map<String, String>> posts = [
    {
      'username': 'user1',
      'profileImage': 'https://via.placeholder.com/150',
      'postImage': 'https://via.placeholder.com/400',
      'caption': 'This is a beautiful day!',
    },
    {
      'username': 'user2',
      'profileImage': 'https://via.placeholder.com/150',
      'postImage': 'https://via.placeholder.com/400',
      'caption': 'Enjoying the weekend vibes!',
    },
    {
      'username': 'user3',
      'profileImage': 'https://via.placeholder.com/150',
      'postImage': 'https://via.placeholder.com/400',
      'caption': 'Nature is amazing!',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SnapGram',
          style: TextStyle(fontFamily: 'Billabong', fontSize: 32),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostCard(
            username: posts[index]['username']!,
            profileImage: posts[index]['profileImage']!,
            postImage: posts[index]['postImage']!,
            caption: posts[index]['caption']!,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String username;
  final String profileImage;
  final String postImage;
  final String caption;

  const PostCard({
    required this.username,
    required this.profileImage,
    required this.postImage,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User info (profile picture and username)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(profileImage),
                radius: 20,
              ),
              SizedBox(width: 10),
              Text(
                username,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        // Post image
        Image.network(
          postImage,
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
        ),
        // Like, comment, and share buttons
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.comment_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {},
              ),
            ],
          ),
        ),
        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            caption,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}