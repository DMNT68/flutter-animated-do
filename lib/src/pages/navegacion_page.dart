import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';


class NavegacionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Notificacions page '),
        ),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BottomNavigation(),
   ),
    );
  }
}

class BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){

        final notiModel = Provider.of<_NotificationModel>(context, listen: false);

        int numero = notiModel.numero;
        numero++;
        notiModel.numero = numero;

        if (numero >= 2) {
          final controller = notiModel.bounceController;
          controller.forward(from: 0.0);
        }

      },
      child: FaIcon(FontAwesomeIcons.play),
      backgroundColor: Colors.pink,
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final int numero = Provider.of<_NotificationModel>(context).numero;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
          label: 'Bones',
          icon: FaIcon(FontAwesomeIcons.bone),
        ),
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack(
            children: [
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0.0,
                right: 0.0,
                // child: Icon(Icons.brightness_1, size: 8, color: Colors.pink,)
                child: BounceInDown(
                  from: 10,
                  controller: (controller) => Provider.of<_NotificationModel>(context).bounceController = controller,
                  animate: (numero > 0)?true : false,
                  child: Bounce(
                    from: 10,
                    child: Container(
                      alignment: Alignment.center,
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        shape: BoxShape.circle
                      ),
                      child: Text('$numero', style: TextStyle(fontSize: 7, color: Colors.white),),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        BottomNavigationBarItem(
          label: 'My dog',
          icon: FaIcon(FontAwesomeIcons.dog),
        )
      ],
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  
  int _numero = 0;
  AnimationController _bounceController;

  int get numero => this._numero;
  set numero (int valor) {
    this._numero=valor;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;
  set bounceController (AnimationController controller) {
    this._bounceController = controller;
    notifyListeners();
  }

}