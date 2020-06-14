import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          LoginBackground(),
          LoginCard(),
        ],
      ),
    );
  }
}

class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  String _mySchool;
  String _myClass;
  List<String> _schools = ['loola acadmy', 'shole acadamy'];
  List<String> _class = ['1', '2', '3'];
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            SizedBox(
              height: deviceSize.height / 2 - 20,
              width: deviceSize.width * 0.85,
              child: Card(
                color: Colors.white,
                elevation: 2.0,
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'School',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          DropdownButton(
                              hint: Text('Choose School'),
                              value: _mySchool,
                              isExpanded: true,
                              items: _schools.map((String v) {
                                return DropdownMenuItem(
                                  child: Text(v),
                                  value: v,
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _mySchool = value.toString();
                                });
                              }),
                          new SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Class:',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          DropdownButton(
                              hint: Text('Choose Class'),
                              value: _myClass,
                              isExpanded: true,
                              items: _class.map((String val) {
                                return DropdownMenuItem(
                                  child: Text('Class: $val'),
                                  value: val,
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _myClass = value.toString();
                                });
                              }),
                          new SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            child: GradientButton(
                                onPressed: () {
                                  print("My School: $_mySchool\nMy Class: $_myClass");
                                },
                                text: "login"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;

  GradientButton({@required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      color: Colors.transparent,
      shape: const StadiumBorder(),
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.yellow,
        child: Ink(
          height: 50.0,
          decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              gradient: LinearGradient(
                colors: [
                  Colors.blueGrey.shade800,
                  Colors.black87,
                ],
              )),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginBackground extends StatelessWidget {
  final showIcon;
  final image;
  LoginBackground({this.showIcon = true, this.image});

  Widget topHalf(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return new Flexible(
      flex: 2,
      child: ClipPath(
        clipper: new ArcClipper(),
        child: Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                colors: [
                  Colors.blueGrey.shade800,
                  Colors.black87,
                ],
              )),
            ),
            showIcon
                ? new Center(
                    child: SizedBox(
                        height: deviceSize.height / 8,
                        width: deviceSize.width / 2,
                        child: FlutterLogo(
                          colors: Colors.yellow,
                        )),
                  )
                : new Container(
                    width: double.infinity,
                    child: image != null
                        ? Image.network(
                            image,
                            fit: BoxFit.cover,
                          )
                        : new Container())
          ],
        ),
      ),
    );
  }

  final bottomHalf = new Flexible(
    flex: 3,
    child: new Container(),
  );

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[topHalf(context), bottomHalf],
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = new Offset(size.width / 4, size.height);
    var firstPoint = new Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint =
        new Offset(size.width - (size.width / 4), size.height);
    var secondPoint = new Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
