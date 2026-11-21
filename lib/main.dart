

import 'package:flutter/material.dart';
void main() {
  runApp(const KuKuEnglishApp());
}

class KuKuEnglishApp extends StatelessWidget {
  const KuKuEnglishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KuKu English',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FF),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'KuKu English',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.deepPurple,
                  child: Icon(
                    Icons.menu_book_rounded,
                    color: Colors.white,
                    size: 60,
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  'Welcome to KuKu English!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Learn English with Confidence',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
  'अपनी English Speaking को बेहतर बनाएं\nLearn English step by step!',
  textAlign: TextAlign.center,
  style: TextStyle(
    fontSize: 17,
    height: 1.6,
    color: Colors.black87,
  ),
),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.6,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const LearningPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.play_arrow),
                    label: const Text(
                      'Start Learning',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'English + Hindi Learning',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w600,
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

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start Learning'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Choose Your Learning Course',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 25),

            courseCard(
              context,
              'Basic English',
              'Learn English from the beginning.',
              Icons.menu_book,
            ),

            courseCard(
              context,
              'Spoken English',
              'Improve your daily conversation.',
              Icons.record_voice_over,
            ),

            courseCard(
              context,
              'Grammar',
              'Learn English grammar step by step.',
              Icons.edit_note,
            ),

            courseCard(
              context,
              'Vocabulary',
              'Learn new English words every day.',
              Icons.abc,
            ),
          ],
        ),
      ),
    );
  }

  Widget courseCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.deepPurple,
          size: 35,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$title course coming soon!'),
            ),
          );
        },
      ),
    );
  }
}
