import 'package:flutter/material.dart';
import '../../Class/Jobs.dart'; // Import your Jobs class here

class JobDetail extends StatefulWidget {
  final Jobs job;

  const JobDetail({Key? key, required this.job}) : super(key: key);

  @override
  _JobDetailState createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  bool applied = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Details'),
      ),
      body: Container(
        color: Colors.blueGrey[800], // Background color
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.job.company,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: applied ? Colors.white38 : Colors.white38, // Container color
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Job Name: ${widget.job.jobname}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Job Description: ${widget.job.jobDescription}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Qualifications: ${widget.job.jobQualification}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Location: ${widget.job.joblocation}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Salary: ${widget.job.salary}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Contact Email: ${widget.job.jobMail}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  applied = !applied;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                  return applied ? Colors.blueAccent : Colors.white;
                }),
              ),
              child: Text(applied ? 'Applied' : 'Apply'),
            ),
          ],
        ),
      ),
    );
  }
}
