import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    String col = data['isdaytime'] ? 'assets/day.png' : 'assets/night.png';
    Color bgcol = data['isdaytime'] ? Colors.blueGrey : Colors.indigo ?? Colors.blue;
    print(data);
    return Scaffold(     //return scaffold that contains body
      backgroundColor: bgcol,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(col),
                fit: BoxFit.cover,
              )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/choose_location');
                    setState(() {
                      data = {'time' : result['time'],
                              'location' : result['location'],
                             'isdaytime' : result['isdaytime'],
                             'flag' : result['flag']};
                      print(data);
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                    data['time'],
                    style: TextStyle(
                        fontSize: 66.0,
                        color: Colors.white
                    )
                ),
              ],
            ),
          ),
        ),
      ),
      );


  }
}

