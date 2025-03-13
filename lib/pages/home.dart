import 'package:flutter/material.dart';
import 'dart:math'; // For random number generation

void main() {
  runApp(InstagramCloneApp());
}

class InstagramCloneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto', // Custom font
      ),
      home: InstagramHomePage(),
    );
  }
}

class InstagramHomePage extends StatelessWidget {
  // List of predefined usernames
  final List<String> usernames = [
    'alice_wonder',
    'bob_marley',
    'charlie_chaplin',
    'diana_ross',
    'elon_musk',
    'fiona_apple',
    'george_clooney',
    'harry_potter',
    'isaac_newton',
    'jennifer_lopez',
  ];

  // Random number generator
  final Random _random = Random();

  // Function to get a random username
  String getRandomUsername() {
    return usernames[_random.nextInt(usernames.length)];
  }

  // Dummy data for posts
  final List<Map<String, String>> posts = List.generate(
    10,
    (index) => {
      'username': 'user$index', // Placeholder, will be replaced
      'profileImage': 'https://via.placeholder.com/150',
      'postImage': Image.asset('assets/h5.jpg'),
      'caption': 'This is post #$index',
    },
  );

  @override
  Widget build(BuildContext context) {
    // Assign random usernames to posts
    for (var post in posts) {
      post['username'] = getRandomUsername();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 32,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, size: 28),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.send, size: 28),
            onPressed: () {},
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
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
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 28),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined, size: 28),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, size: 28),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 28),
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
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info (profile picture and username)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profileImage),
                  radius: 20,
                ),
                SizedBox(width: 10),
                Text(
                  username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.more_vert, size: 24),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          // Post image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              postImage,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          // Like, comment, and share buttons
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border, size: 28),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.comment_outlined, size: 28),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.send, size: 28),
                  onPressed: () {},
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.bookmark_border, size: 28),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          // Caption
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: '$username ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: caption),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}