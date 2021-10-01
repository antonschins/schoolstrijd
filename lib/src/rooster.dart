import 'package:flutter/material.dart';

class RoosterPage extends StatelessWidget {
  RoosterPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rooster'),
      ),// TODO: use stack instead of Column
      body: Center(child: Stack(
        children: RoosterAct.position([
          RoosterAct(begin: TimeOfDay(hour: 8,minute: 30),end: TimeOfDay(hour: 9,minute: 40),name: "wrong"),
          RoosterAct(begin: TimeOfDay(hour: 9,minute: 45),end: TimeOfDay(hour: 10,minute: 55),name: "testing"),
          RoosterAct(begin: TimeOfDay(hour: 10,minute: 55),end: TimeOfDay(hour: 11,minute: 25),name: "test")],)),)
    );
  }
}

class RoosterAct extends StatelessWidget{
  RoosterAct({required this.begin,required this.end,required this.name});
  final TimeOfDay begin;
  final TimeOfDay end;
  final String name;

  final TextStyle roosterStyle = const TextStyle(backgroundColor: Colors.blueGrey,fontSize: 25);

  // return the time between 2 TimeOfDays in minutes
  int getTimeBetween(TimeOfDay first, TimeOfDay second){
    int hour = second.hour - first.hour;
    int min = second.minute - first.minute;
    int result = hour * 60 + min;
    if (result < 0)
      return result * -1;
    return result;
  }

  static List<Positioned> position(List<RoosterAct> acts){
    List<Positioned> end = [];
    for (RoosterAct act in acts){
      Positioned pos = Positioned(
          top: (((act.begin.hour*60 +act.begin.minute)-480)*2.05).toDouble(),
          left: 20,
          child:act
      );
      end.add(pos);
      print(((act.begin.hour*60 +act.begin.minute)-480).toDouble());
    }
    return end;
  }

  Container build(BuildContext context) {
    String text=begin.format(context) + "-" + end.format(context) + "\n"+name;
    print(getTimeBetween(TimeOfDay(hour: 0,minute: 5), TimeOfDay(hour: 0,minute: 0)) * 2);
    double height = getTimeBetween(end, begin) * 2;
    return Container(
      // color: Colors.red,
      width: 350+10,
      height: height + 10,
        child:Center(child:Container(
          color: Colors.blueGrey,
          width: 350,
          height: height,
          child: Center(
            child: Text(text, style: roosterStyle,),
        )
      ))
    );
  }
}