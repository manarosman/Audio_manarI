import 'package:flutter/material.dart';
import 'package:helloworld/properties.dart';
import 'package:helloworld/screen/auth/welcome.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  Widget build(BuildContext) {
    return MaterialApp(
      home: login(),
    );
  }
}

class login extends StatefulWidget {
  @override
  _login createState() => _login();
}

class _login extends State<login> with SingleTickerProviderStateMixin {
  late Animation<double> opacity;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 5500), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigationPage() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomeBackPage()));
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://us.123rf.com/450wm/pitinan/pitinan2308/pitinan230805662/210316560-photo-franche-d-une-jeune-femme-africaine-excit%C3%A9e-faisant-la-f%C3%AAte-avec-un-casque-une-belle-ia.jpg?ver=6'),
              fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(color: transparentYellow),
        child: SafeArea(
          child: new Scaffold(
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Opacity(
                      opacity: opacity.value,
                      child: new Image.network(
                          'https://d27jswm5an3efw.cloudfront.net/app/uploads/2019/11/audio-file-types-36.jpg')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
