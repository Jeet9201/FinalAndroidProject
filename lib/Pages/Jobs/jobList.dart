import 'package:flutter/material.dart';
import '../../Class/Jobs.dart';
import '../Candidates/candidateList.dart';
import '../homepage.dart';
import 'jobDetails.dart';

class JobPage extends StatelessWidget {
  const JobPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Jobs> joblist = [];

    joblist.add(Jobs(
      "Google",
      "Software Engineer",
      "Bachelor's Degree in Computer Science or related field. Proficiency in programming languages like Java, Python, or C++. Experience with software development lifecycle (SDLC) methodologies.",
      "jobs@google.com",
      "Software Engineer",
      "Mountain View, CA",
      "\$120,000 - \$200,000 per year",
      "google_image",
    ));
    joblist.add(Jobs(
      "Microsoft",
      "Data Scientist",
      "Master's Degree or PhD in Computer Science, Statistics, Mathematics, or related field. Strong analytical skills and proficiency in programming languages such as R or Python. Experience with machine learning algorithms and data visualization tools.",
      "jobs@microsoft.com",
      "Data Scientist",
      "Redmond, WA",
      "\$130,000 - \$180,000 per year",
      "microsoft_image",
    ));
    joblist.add(Jobs(
      "Amazon",
      "Product Manager",
      "Bachelor's or Master's Degree in Business Administration or related field. Strong analytical and problem-solving skills. Experience in product management, including product development and launch.",
      "jobs@amazon.com",
      "Product Manager",
      "Seattle, WA",
      "\$150,000 - \$220,000 per year",
      "amazon_image",
    ));
    joblist.add(Jobs(
      "Apple",
      "iOS Developer",
      "Bachelor's Degree in Computer Science or related field. Proficiency in Swift and Objective-C. Experience with iOS SDK and Xcode development environment.",
      "jobs@apple.com",
      "iOS Developer",
      "Cupertino, CA",
      "\$140,000 - \$190,000 per year",
      "apple_image",
    ));
    joblist.add(Jobs(
      "Facebook",
      "Marketing Manager",
      "Bachelor's or Master's Degree in Marketing or related field. Strong communication and interpersonal skills. Experience in digital marketing, social media strategy, and campaign management.",
      "jobs@facebook.com",
      "Marketing Manager",
      "Menlo Park, CA",
      "\$120,000 - \$170,000 per year",
      "facebook_image",
    ));
    joblist.add(Jobs(
      "Twitter",
      "Content Strategist",
      "Bachelor's Degree in Journalism, Communications, or related field. Excellent writing and editing skills. Experience in content strategy, social media management, and audience engagement.",
      "jobs@twitter.com",
      "Content Strategist",
      "San Francisco, CA",
      "\$110,000 - \$160,000 per year",
      "twitter_image",
    ));
    joblist.add(Jobs("Tesla", "Electrical Engineer", "Bachelor's Degree in Electrical Engineering", "jobs@tesla.com", "Electrical Engineer", "California, USA", "\$80,000 - \$100,000", "jobImage7"));
    joblist.add(Jobs("IBM", "Software Developer", "Bachelor's Degree in Computer Science", "jobs@ibm.com", "Software Developer", "New York, USA", "\$70,000 - \$90,000", "jobImage8"));
    joblist.add(Jobs("SpaceX", "Aerospace Engineer", "Bachelor's Degree in Aerospace Engineering", "jobs@spacex.com", "Aerospace Engineer", "Texas, USA", "\$90,000 - \$110,000", "jobImage9"));
    joblist.add(Jobs("Netflix", "Data Analyst", "Bachelor's Degree in Statistics", "jobs@netflix.com", "Data Analyst", "California, USA", "\$60,000 - \$80,000", "jobImage10"));
    joblist.add(Jobs("Amazon Web Services", "Cloud Architect", "Bachelor's Degree in Computer Science", "jobs@aws.com", "Cloud Architect", "Washington, USA", "\$100,000 - \$120,000", "jobImage11"));
    joblist.add(Jobs("Google", "Product Manager", "Bachelor's Degree in Business Administration", "jobs@google.com", "Product Manager", "California, USA", "\$120,000 - \$150,000", "jobImage12"));

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
            // Navigate to work page
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jobs',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: joblist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JobDetail(job: joblist[index]),
                          ),
                        );
                      },
                      child: Card(
                        color: Color.fromARGB(255, 75, 128, 158),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                joblist[index].company,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Job Qualification: ${joblist[index].jobQualification}',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Text(
                                'Job Location: ${joblist[index].joblocation}',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Text(
                                'Salary: ${joblist[index].salary}',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
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
      ),
    );
  }
}