import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _formKey = GlobalKey<FormState>();
  String? _postName;
  String? _postDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        title: Text('Create New Post'),
      ),
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
              Navigator.pushNamed(context, '/job');
              break;
            case 2:
            // Navigate to candidate page
              Navigator.pushNamed(context, '/candidate');
              break;
          }
        },
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Post Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a post name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _postName = value;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Post Details'),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter post details';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _postDetails = value;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Thank you for posting"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Post Name: $_postName"),
                                      Text("Post Details: $_postDetails"),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Text('Submit'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.reset();
                          setState(() {
                            _postName = null;
                            _postDetails = null;
                          });
                        },
                        child: Text('Cancel'),
                      ),
                    ],
                  ),
                  if (_postName != null || _postDetails != null)
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(10),
                      color: Colors.blue[100],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_postName != null) Text("Post Name: $_postName"),
                          if (_postDetails != null) Text("Post Details: $_postDetails"),
                        ],
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
