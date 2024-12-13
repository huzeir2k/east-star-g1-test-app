import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Row(
              children: [
                const Icon(Icons.emoji_emotions, size: 48, color: Colors.blue),
                const SizedBox(width: 10),
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // G1 Box
            Expanded(
              child: _buildContentBox(
                icon: Icons.directions_car,
                title: 'G1',
                score: '0/40',
                onTap: () {
                  // Handle G1 Click
                  Navigator.pushNamed(context, '/g1Quiz'); // Example route
                },
              ),
            ),
            const SizedBox(height: 20),
            // M1 Box
            Expanded(
              child: _buildContentBox(
                icon: Icons.motorcycle,
                title: 'M1',
                score: '0/40',
                onTap: () {
                  // Handle M1 Click
                  Navigator.pushNamed(context, '/m1Quiz'); // Example route
                },
              ),
            ),
            const SizedBox(height: 20),
            // Resource and Fun Facts Section
            Expanded(
              flex: 2,
              child: _buildResourceSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentBox({
    required IconData icon,
    required String title,
    required String score,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue, width: 1),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: Colors.blue),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text('Your score:'),
            const SizedBox(height: 5),
            Text(
              score,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResourceSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Resources',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('- Official MTO Driver\'s Manual (G1)'),
          Text('- Official MTO Motorcycle Handbook (M1)'),
          SizedBox(height: 10),
          Text(
            'Fun Facts:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text('- The first speeding ticket was issued in 1902.'),
          Text('- The average car contains over 30,000 parts.'),
          Spacer(),
          Text(
            '© 2024: East Star Driving School',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
