import 'package:flutter/material.dart';
import 'package:yuefou_flutter/src/graphql/activities.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ActivitiesQuery>(
      future: ActivitiesService.instance.list(),
      builder: (context, snapshot) {
        // if (snapshot.hasData) {
        //   return Text(snapshot.data.title);
        // } else if (snapshot.hasError) {
        //   return Text("${snapshot.error}");
        // }

        // By default, show a loading spinner
        if(snapshot.data == null) return Center();

        var activity = snapshot.data.activities.collection[0];

        return new Card(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.album),
                title: Text(activity.title.value ?? 'activity-title'),
                subtitle:
                    const Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
              new ButtonTheme.bar(
                // make buttons use the appropriate styles for cards
                child: new ButtonBar(
                  children: <Widget>[
                    new FlatButton(
                      child: const Text('BUY TICKETS'),
                      onPressed: () {/* ... */},
                    ),
                    new FlatButton(
                      child: const Text('LISTEN'),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
