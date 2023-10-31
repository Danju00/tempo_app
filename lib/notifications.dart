import 'package:flutter/material.dart';
import 'package:tempo_app/home_screen.dart';
import 'package:tempo_app/profile.dart';

void main() => runApp(const Notifications());

class Notifications extends StatelessWidget {
  static String id = 'Notifications';
  const Notifications({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 72, 165, 144),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 72, 165, 144),
          title: Text('Notificaciones'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  OvalButton(
                    text: 'All',
                    color: Color.fromRGBO(128, 128, 128, 0.7),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              DismissibleCard(
                key: UniqueKey(),
                child: GestureDetector(
                  onTap: () {
                    _showNotificationDialog(context, 'Notificación 1',
                        'Este es el texto de la notificación 1.');
                  },
                  child: Card(
                    child: ListTile(
                      title: Text('Notificacion 1'),
                    ),
                  ),
                ),
              ),
              DismissibleCard(
                key: UniqueKey(),
                child: Card(
                  child: ListTile(
                    title: Text('Notificacion 2'),
                  ),
                ),
              ),
              // Otras tarjetas de notificación aquí
            ],
          ),
        ),
        bottomNavigationBar: BottomIcons(),
      ),
    );
  }
}

class OvalButton extends StatelessWidget {
  final String text;
  final Color color;

  const OvalButton({
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        primary: color, // Color de fondo
      ),
      child: Text(text),
    );
  }
}

class BottomIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(38, 31, 31, 0.7),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
      ),
      height: 90.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //home
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          //noficications
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notifications()),
              );
            },
            child: Icon(Icons.notifications, color: Colors.white),
          ),
          //profile
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            child: Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

//Parte encarga de mostrar las notificaciones generadas por el sistema web
class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones'),
      ),
      body: Center(
        child: Text('Contenido de la página de notificaciones'),
      ),
    );
  }
}

class DismissibleCard extends StatelessWidget {
  final Key key;
  final Widget child;

  const DismissibleCard({
    required this.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key,
      onDismissed: (direction) {
        // Aquí puedes realizar alguna acción cuando se deslice la tarjeta
      },
      background: Container(
        color:
            Color.fromARGB(255, 131, 131, 131), // Color del fondo al deslizar
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40.0,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.0),
      ),
      child: child,
    );
  }
}

void _showNotificationDialog(BuildContext context, String title, String text) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cerrar'),
          ),
        ],
      );
    },
  );
}
