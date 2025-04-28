import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Leaderboard',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          _buildTopThree(),
          const SizedBox(height: 20),
          Expanded(child: _buildLeaderboardList()),
          _buildCurrentUser(),
        ],
      ),
    );
  }

  Widget _buildTopThree() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildWinnerTile(
          'Christy',
          '5000',
          2,
          imagePath: 'assets/user_image/user_placeholder.png',
        ),
        const SizedBox(width: 20),
        _buildWinnerTile(
          'Aloy',
          '6000',
          1,
          isCenter: true,
          imagePath: 'assets/user_image/user_placeholder.png',
        ),
        const SizedBox(width: 20),
        _buildWinnerTile(
          'Warren',
          '4000',
          3,
          imagePath: 'assets/user_image/user_placeholder.png',
        ),
      ],
    );
  }

  Widget _buildWinnerTile(
    String name,
    String points,
    int place, {
    bool isCenter = false,
    required String imagePath,
  }) {
    return Column(
      children: [
        Text(
          place == 1
              ? '1ST'
              : place == 2
              ? '2ND'
              : '3RD',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: place == 1 ? Colors.blue : Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        CircleAvatar(
          radius: isCenter ? 40 : 30,
          backgroundColor: Colors.blue,
          child: CircleAvatar(
            radius: isCenter ? 36 : 26,
            backgroundImage: AssetImage(imagePath),
          ),
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text('$points PTS', style: const TextStyle(color: Colors.blue)),
      ],
    );
  }

  Widget _buildLeaderboardList() {
    final users = [
      {
        'name': 'Alexander Hipp',
        'points': '4550',
        'image': 'assets/user_image/user_placeholder.png',
      },
      {
        'name': 'Bro Hamdan',
        'points': '4500',
        'image': 'assets/user_image/user_placeholder.png',
      },
      {
        'name': 'Mas Nabil',
        'points': '4250',
        'image': 'assets/user_image/user_placeholder.png',
      },
      {
        'name': 'Mesut Cicen',
        'points': '3750',
        'image': 'assets/user_image/user_placeholder.png',
      },
      {
        'name': 'Lyta',
        'points': '1500',
        'image': 'assets/user_image/user_placeholder.png',
      },
      {
        'name': 'Taras Shypka',
        'points': '1200',
        'image': 'assets/user_image/user_placeholder.png',
      },
    ];

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage(user['image']!)),
          title: Text(user['name']!),
          trailing: Text(
            '${user['points']} PTS',
            style: const TextStyle(color: Colors.blue),
          ),
        );
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }

  Widget _buildCurrentUser() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.red,
      child: Row(
        children: const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/user_image/user_placeholder.png'),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              'Chesa',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text('1100 PTS', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
