import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(MyApp());
}
//Can you see this?


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Uni',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: new MyHomePage(title: 'Hello User!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    // open link
    const url = 'https://youtube.com';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }

    // send sms message
    //Android
    /*const uri = 'sms:+1 650 555 1212?body=text%20message';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // iOS
      const uri = 'sms:0039-222-060-888&body=message';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }*/

    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[Colors.deepPurple, Colors.purpleAccent]),
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/happy.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Soyon Kim',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //CustomListTile(Icons.person, 'Profile', () => Profile()),
          ],
        ),
      ),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have been in touch with your counselor this many times',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.call),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Widget Function() createPage;

  CustomListTile(this.icon, this.text, this.createPage);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
          splashColor: Colors.purpleAccent,
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return createPage();
            }));
          },
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
