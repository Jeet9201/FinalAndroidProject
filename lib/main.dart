import 'package:flutter/material.dart';
import 'package:newnew/Pages/splash_Screen.dart';
import 'Class/Candidates.dart';
import 'Pages/Candidates/candidateDetail.dart';
import 'Pages/Candidates/candidateList.dart';
import 'Pages/Jobs/jobList.dart';
import 'Pages/homepage.dart';
import 'Pages/postUpdate.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {

        '/': (context) => SplashScreen(),
        '/home': (context)=> Homepage(),
        '/job': (context) => JobPage(),
        '/candidate': (context) => CandidateList(),
        '/candidate_detail': (context) =>
            CandidateDetailPage(candidate: ModalRoute.of(context)!.settings.arguments as Candidate),
        '/post': (context) => PostPage(),
      },
    );
  }
}


