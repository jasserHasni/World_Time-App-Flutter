import 'package:flutter/material.dart';
import 'package:time_app/services/services.dart';

class choose extends StatefulWidget {
   choose({super.key});

  @override
  State<choose> createState() => _chooseState();
}


class _chooseState extends State<choose> {

  @override
  void initState() {
    super.initState();
  }
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(location: 'Cairo', flag: 'egypt.png',url: 'Africa/Cairo'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void Updatetime(index) async {
    WorldTime instance = locations[index];
    await instance.gettime();
    Navigator.pop(context, {
      'location' : instance.location , 'time' : instance.time ,'flag' : instance.flag, 'isdaytime' : instance.isdaytime
    });
    print(instance.time);



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[85],
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("choose a location"),
          centerTitle: true,
          elevation: 0, //removes shadow under the appbar
        ),
        body: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0,horizontal: 4.0),
                child: Card(
                    child: ListTile(
                        onTap: () {
                          Updatetime(index);
                        },

                        title: Text(locations[index].location),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/${locations[index].flag}'),
                        ),
                    )
                ),
              );
            }


        )
    );
  }
}
