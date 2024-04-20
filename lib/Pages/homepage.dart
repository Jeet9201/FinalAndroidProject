import 'package:flutter/material.dart';
import 'package:newnew/Pages/postUpdate.dart';
import '../Class/Post.dart';
import 'Candidates/candidateList.dart';
import 'Jobs/jobList.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();


  static final GlobalKey<_HomepageState> homepageKey = GlobalKey<_HomepageState>();

}

class _HomepageState extends State<Homepage> {
  List<Post> postlist = [
    Post(
        "Senior Software Engineer Position at Tech Innovations Inc.",
        "We're looking for a talented and experienced Senior Software Engineer to join our team at Tech Innovations Inc. The ideal candidate should have a strong background in software development, particularly in building scalable and robust web applications. Experience with modern frontend and backend technologies such as React, Node.js, and MongoDB is highly desirable. If you're passionate about innovation and enjoy working in a collaborative environment, apply now!"
    ),
    Post(
        "Marketing Coordinator Role at Global Marketing Solutions",
        "Global Marketing Solutions is seeking a dynamic and creative Marketing Coordinator to join our marketing team. The successful candidate will be responsible for developing and executing marketing campaigns, managing social media channels, and coordinating with internal and external stakeholders to drive brand awareness and lead generation. Candidates should have excellent communication skills, a strategic mindset, and a passion for marketing. If you're ready to make an impact in a fast-paced environment, apply today!"
    ),
    Post(
        "Data Analyst Internship Opportunity at Analytics Hub",
        "Analytics Hub is offering an exciting Data Analyst Internship opportunity for students or recent graduates looking to gain hands-on experience in data analysis and visualization. The intern will work closely with our analytics team to collect, analyze, and interpret data to provide valuable insights and recommendations to clients. Candidates should have strong analytical skills, proficiency in Excel and data visualization tools, and a keen interest in data-driven decision-making. Don't miss out on this chance to kick-start your career in data analytics!"
    ),
    Post(
        "Product Designer Position at Innovative Tech Startup",
        "Join our innovative tech startup as a Product Designer and play a key role in shaping the future of our product. We're seeking a creative and user-focused designer who can translate complex ideas into intuitive and visually appealing designs. The ideal candidate should have a strong portfolio showcasing their design process and proficiency in design tools such as Sketch, Adobe XD, or Figma. If you're passionate about creating exceptional user experiences and thrive in a collaborative environment, we want to hear from you!"
    ),
    Post(
        "HR Manager Role at Growing E-commerce Company",
        "Are you an experienced HR professional looking for a new challenge? Join our growing e-commerce company as an HR Manager and lead our HR initiatives to support our expanding team. The successful candidate will oversee recruitment, employee relations, performance management, and HR policies to ensure a positive work environment and employee satisfaction. Strong interpersonal skills, HR expertise, and the ability to drive organizational change are essential. Take the next step in your HR career and apply now!"
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF37474F),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Work',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Candidate',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
            // Navigate to home page
              break;
            case 1:
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => JobPage(),
                  transitionsBuilder: (context, animation1, animation2, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset(0.0, 0.0);
                    const curve = Curves.ease;
                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    var offsetAnimation = animation1.drive(tween);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => CandidateList(),
                  transitionsBuilder: (context, animation1, animation2, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset(0.0, 0.0);
                    const curve = Curves.ease;
                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    var offsetAnimation = animation1.drive(tween);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
              break;
          }
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Homepage',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[600],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[600],
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Search',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Posts',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) => PostPage(),
                              transitionsBuilder: (context, animation1, animation2, child) {
                                const begin = Offset(0.0, 0.5);
                                const end = Offset.zero;
                                const curve = Curves.ease;
                                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                var offsetAnimation = animation1.drive(tween);
                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        child: Icon(
                          Icons.add_comment_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: postlist.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        child: Card(
                          elevation: 3, // Adjust elevation as needed
                          child: ListTile(
                            title: Text(postlist[index].name),
                            subtitle: Text(postlist[index].details),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
