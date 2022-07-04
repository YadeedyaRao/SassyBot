import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'body.dart';
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home : Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  _launchURLBrowser() async {
    var url = Uri.parse("https://www.iitg.ac.in/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      drawer: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          centerTitle: true,
          title: const Text('About'),
        ),
        body:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Column(
                    children: [
                      const SizedBox(
                        height:20.0,
                      ),
                      const Text('This app is made by the team ',
                      style: TextStyle(
                      fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                      ),
                      const SizedBox(
                        height:20.0,
                      ),
                      const Text('SASSY',
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'Lobster',
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                      const SizedBox(
                        height:10.0,
                      ),
                      TextButton(
                          onPressed: _launchURLBrowser,
                          child:const Text('@ IIT Guwahati',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                      ),
                    ],
                  ),
                const SizedBox(
                  height:10.0,
                ),
                const Text('Team Members',
                  style: TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                const SizedBox(
                  height:20.0,
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration:const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.elliptical(10.0, 10.0))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text('Yadeedya Rao',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Text('(Team Leader)',
                            style: TextStyle(
                              color: Colors.brown,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.mail,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('r.chintlapudi@iitg.ac.in',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: const [
                          Text('Shashank',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.mail,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('bandaru.shashank@iitg.ac.in',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: const [
                          Text('Sai Raj',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.mail,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('g.sairaj@iitg.ac.in',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: const [
                          Text('Shashikanth',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.mail,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('s.shanigarapu@iitg.ac.in',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: const [
                          Text('Amit',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.mail,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('amit.kushwaha@iitg.ac.in',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sassy Bot'),
      ),
      body :  const Body(),
    );
  }
}