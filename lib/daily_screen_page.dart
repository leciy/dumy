import 'package:flutter/material.dart';

const String rewardCoinPath = 'assets/reward_coin.png';
const String threeRewardCoinPath = 'assets/three_reward_coin.png';

class DailyCheckInScreen extends StatelessWidget {
  const DailyCheckInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black54),
          onPressed: () {},
        ),
        title: const Text(
          'Daily Check-in',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const UserInfoSection(),
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: [WeeklyCalendarSection()]),
                  ),
                ),
                const SizedBox(height: 24),
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TasksSection(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: const Icon(Icons.person, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Signed up for 2 Days',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            Text(
              'Sign for 10 Points tomorrow',
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.amber[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Image.asset(rewardCoinPath, width: 18, height: 18),
              const SizedBox(width: 4),
              Text(
                '1100',
                style: TextStyle(
                  color: Colors.amber[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WeeklyCalendarSection extends StatelessWidget {
  const WeeklyCalendarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double spacing = 12;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildExpandedCard('Mon', true, Colors.blue, 10),
              SizedBox(width: spacing),
              _buildExpandedCard('Tue', false, Colors.amber, 10),
              SizedBox(width: spacing),
              _buildExpandedCard('Wed', false, Colors.amber, 10),
              SizedBox(width: spacing),
              _buildExpandedCard('Thu', false, Colors.amber, 10),
            ],
          ),
          const SizedBox(height: spacing),
          Row(
            children: [
              _buildExpandedCard('Fri', false, Colors.amber, 10),
              SizedBox(width: spacing),
              _buildExpandedCard('Sat', false, Colors.amber, 10),
              SizedBox(width: spacing),
              Expanded(
                flex: 2,
                child: AspectRatio(
                  aspectRatio: 2.0,
                  child: _buildCardContent(
                    day: 'Sun',
                    isActive: false,
                    color: Colors.grey[200]!,
                    isSpecial: true,
                    specialText: 'Mystery Points',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedCard(
    String day,
    bool isActive,
    Color color,
    int points, {
    bool isSpecial = false,
    String? specialText,
  }) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1.0, // square cards
        child: _buildCardContent(
          day: day,
          isActive: isActive,
          color: color,
          points: points,
          isSpecial: isSpecial,
          specialText: specialText,
        ),
      ),
    );
  }

  Widget _buildCardContent({
    required String day,
    required bool isActive,
    required Color color,
    int points = 0,
    bool isSpecial = false,
    String? specialText,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isActive ? color : Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment:
                isSpecial ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: [
              Text(
                day,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          if (isSpecial)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      specialText ?? '',
                      style: TextStyle(
                        color: isActive ? Colors.white70 : Colors.black54,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
                Image.asset(threeRewardCoinPath, width: 36, height: 36),
              ],
            )
          else
            Column(
              children: [
                Image.asset(rewardCoinPath, width: 24, height: 24),
                const SizedBox(height: 4),
                Text(
                  '$points Points',
                  style: TextStyle(
                    color: isActive ? Colors.white70 : Colors.black54,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class TasksSection extends StatelessWidget {
  const TasksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Do the Task',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 16),
        _buildTaskItem('Sign in for 3 Days', 'Earn 10 additional Points', 10),
        const SizedBox(height: 16),
        _buildTaskItem('Sign in for 7 Days', 'Earn 10 additional Points', 30),
        const SizedBox(height: 16),
        _buildTaskItem('Complete 1 course', 'Earn 100 additional Points', 100),
      ],
    );
  }

  Widget _buildTaskItem(String title, String subtitle, int points) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Image.asset(rewardCoinPath, width: 18, height: 18),
              const Icon(Icons.add, color: Colors.white, size: 16),
              const SizedBox(width: 2),
              Text(
                '$points',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
