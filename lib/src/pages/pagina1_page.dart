import 'package:animated_do/src/pages/navegacion_page.dart';
import 'package:animated_do/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
          duration: Duration(milliseconds: 500),
          child: Text('Animated_do')
        ),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.twitter), 
            onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TwitterPage()));
            }
          ),
          SlideInLeft(
            from: 10,
            child: IconButton(
              icon: FaIcon(FontAwesomeIcons.chevronRight), 
              onPressed: (){
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => Pagina1Page()));
              }
            ),
          )
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NavegacionPage()));
          },
          child: FaIcon(FontAwesomeIcons.play),
     ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: Duration(milliseconds: 1100),
              child: Icon(Icons.new_releases, color: Colors.blue, size: 40,)
            ),
            FadeInDown(
              delay: Duration(milliseconds: 200),
              child: Text('Titulo', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),)
            ),
            FadeInDown(
              delay: Duration(milliseconds: 800),
              child: Text('Soy un texto peque??o', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),)
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1100),
              child: Container( width: 200, height: 2, color: Colors.blue,)
            )
          ],
        ),
     ),
   );
  }
}