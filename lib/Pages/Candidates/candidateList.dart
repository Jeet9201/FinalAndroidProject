import 'package:flutter/material.dart';
import '../../Class/Candidates.dart';
import '../Jobs/jobList.dart';
import '../homepage.dart';
import 'candidateDetail.dart';

class CandidateList extends StatelessWidget {
  const CandidateList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Candidate> candidatesList = [];
    candidatesList.add(Candidate("Michael Johnson", "System Administrator", "can1.jpeg", "michael.johnson@example.com", "Bachelor's degree in Information Technology", "Linux", "Networking", "Intermediate", "Intermediate"));
    candidatesList.add(Candidate("Sarah Adams", "Software Developer", "can2.jpeg", "sarah.adams@example.com", "Bachelor's degree in Computer Science", "Java", "Python", "Intermediate", "Intermediate"));
    candidatesList.add(Candidate("Alex Miller", "Data Scientist", "candidate3.jpeg", "alex.miller@example.com", "Master's degree in Statistics", "R", "Python", "Advanced", "Intermediate"));
    candidatesList.add(Candidate("Grace Wilson", "UI/UX Designer", "candidate4.jpeg", "grace.wilson@example.com", "Bachelor's degree in Design", "Adobe XD", "Figma", "Intermediate", "Intermediate"));
    candidatesList.add(Candidate("Daniel Thompson", "Project Coordinator", "candidate5.jpeg", "daniel.thompson@example.com", "Bachelor's degree in Business Administration", "Project Management", "Communication", "Intermediate", "Intermediate"));
    candidatesList.add(Candidate("Olivia Martinez", "Quality Assurance Analyst", "candidate6.jpeg", "olivia.martinez@example.com", "Bachelor's degree in Computer Science", "Manual Testing", "Automated Testing", "Intermediate", "Intermediate"));
    candidatesList.add(Candidate("Emily Davis", "Web Developer", "candidate7.jpeg", "emily.davis@example.com", "Bachelor's degree in Computer Science", "HTML", "CSS", "Intermediate", "Intermediate"));
    candidatesList.add(Candidate("James Wilson", "Mobile App Developer", "candidate8.jpeg", "james.wilson@example.com", "Bachelor's degree in Software Engineering", "Flutter", "Java", "Intermediate", "Intermediate"));
    candidatesList.add(Candidate("Sophia Anderson", "Database Administrator", "candidate9.jpeg", "sophia.anderson@example.com", "Bachelor's degree in Information Systems", "SQL", "Database Management", "Advanced", "Intermediate"));
    candidatesList.add(Candidate("William Moore", "Network Engineer", "can1.jpeg", "william.moore@example.com", "Bachelor's degree in Networking", "Cisco", "Routing", "Advanced", "Intermediate"));
    candidatesList.add(Candidate("Ava Rodriguez", "Digital Marketing Specialist", "can2.jpeg", "ava.rodriguez@example.com", "Bachelor's degree in Marketing", "SEO", "Social Media Marketing", "Intermediate", "Intermediate"));
    candidatesList.add(Candidate("Ethan Garcia", "UX Researcher", "candidate3.jpeg", "ethan.garcia@example.com", "Master's degree in Human-Computer Interaction", "User Testing", "Prototyping", "Advanced", "Intermediate"));
    candidatesList.add(Candidate("Mia Martinez", "Content Writer", "candidate4.jpeg", "mia.martinez@example.com", "Bachelor's degree in English Literature", "Copywriting", "Content Strategy", "Intermediate", "Intermediate"));
    candidatesList.add(Candidate("Noah Hernandez", "Cybersecurity Analyst", "candidate5.jpeg", "noah.hernandez@example.com", "Bachelor's degree in Cybersecurity", "Ethical Hacking", "Security Operations", "Advanced", "Intermediate"));
    candidatesList.add(Candidate("Isabella Lopez", "Graphic Designer", "candidate6.jpeg", "isabella.lopez@example.com", "Bachelor's degree in Graphic Design", "Adobe Photoshop", "Illustrator", "Intermediate", "Intermediate"));
    candidatesList.add(Candidate("Jacob Thompson", "Financial Analyst", "candidate7.jpeg", "jacob.thompson@example.com", "Bachelor's degree in Finance", "Financial Modeling", "Data Analysis", "Advanced", "Intermediate"));


    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
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
            // Navigate to home page with slide transition
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => Homepage(),
                  transitionsBuilder: (context, animation1, animation2, child) {
                    const begin = Offset(-1.0, 0.0);
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
            case 1:
            // Navigate to work page with slide transition
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => JobPage(),
                  transitionsBuilder: (context, animation1, animation2, child) {
                    const begin = Offset(-1.0, 0.0);
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
            // Navigate to candidate page
              break;
          }
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Candidates',
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
            ),
            Expanded(
              child: ListView.builder(
                itemCount: candidatesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => CandidateDetailPage(candidate: candidatesList[index]),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Card(
                        color: Color.fromARGB(255, 75, 128, 158),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage('assets/images/${candidatesList[index].image}'),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      candidatesList[index].name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      candidatesList[index].description,
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}