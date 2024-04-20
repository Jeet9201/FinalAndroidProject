import 'package:flutter/material.dart';
import '../../Class/Candidates.dart';

class CandidateDetailPage extends StatefulWidget {
  final Candidate candidate;

  const CandidateDetailPage({Key? key, required this.candidate}) : super(key: key);

  @override
  _CandidateDetailPageState createState() => _CandidateDetailPageState();
}

class _CandidateDetailPageState extends State<CandidateDetailPage> {
  bool connected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidate Detail'),
      ),
      body: Container(
        color: Colors.blueGrey[800],
        child: Center(
          child: Card(
            margin: EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.candidate.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.candidate.description,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Email: ${widget.candidate.email}'),
                      SizedBox(height: 10),
                      Text('Qualification: ${widget.candidate.qualification}'),
                      SizedBox(height: 10),
                      Text('Skills: ${widget.candidate.skillID1Name}, ${widget.candidate.skillID2Name}'),
                      SizedBox(height: 10),
                      Text('Skill Levels: ${widget.candidate.skillId1Level}, ${widget.candidate.skillId2Level}'),
                      SizedBox(height: 20),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: connected ? Colors.grey[800] : Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              connected = !connected;
                            });
                          },
                          child: Center(
                            child: Text(
                              connected ? 'Connected' : 'Connect',
                              style: TextStyle(
                                color: connected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: -10,
                    right: -10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/${widget.candidate.image}'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
