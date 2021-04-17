import 'package:flutter/material.dart';

class TopScreenSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top screen settings'),
      ),
      body: TopScreenSettingsFill(),
    );
  }
}

class TopScreenSettingsFill extends StatefulWidget {
  @override
  _TopScreenSettingsFillState createState() => _TopScreenSettingsFillState();
}

class _TopScreenSettingsFillState extends State<TopScreenSettingsFill> {
  _openSettings() {
    /*Navigator.of(context).push(
      MaterialPageRoute<Null>(
        fullscreenDialog: true,
        builder: (context) {
          return TopScreenSettingsDialog();
        },
      ),
    );*/

    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, _, __) {
          return TopScreenSettingsDialog();
        },
      ),
    );

    /*showDialog(
      context: context,
      builder: (context) => TopScreenSettingsDialog(),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.lightBlueAccent,
        child: RaisedButton(
          onPressed: _openSettings,
          child: Text('Open settings'),
        ),
      ),
    );
  }
}

class TopScreenSettingsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.green,
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Text(
          'Settings',
          style:
              Theme.of(context).textTheme.title.copyWith(color: Colors.green),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildEntry(),
            buildEntry(),
            buildEntry(),
            buildEntry(),
            buildEntry(),
            buildEntry(),
          ],
        ),
      ),
    );
  }

  Widget buildEntry() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 40,
          width: 40,
          child: Center(
            child: Icon(Icons.directions_car),
          ),
        ),
        Text('Directions'),
      ],
    );
  }
}
