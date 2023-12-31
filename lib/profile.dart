import 'package:flutter/material.dart';
import 'package:tempo_app/home_screen.dart';
import 'package:tempo_app/notifications.dart';

void main() => runApp(const Profile());

class Profile extends StatelessWidget {
  static String id = 'Profile';

  const Profile({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 72, 165, 144),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 72, 165, 144),
          title: Text('Perfil'),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/img/usuario.png'),
              ),
            ),
            SizedBox(height: 100.0),
            SemiOvalButton(text: 'Botón 1'),
            SizedBox(height: 25.0), // Separación entre botones
            SemiOvalButton(text: 'Botón 2'),
            SizedBox(height: 25.0), // Separación entre botones
            SemiOvalButton(text: 'Botón 3'),
            // Otro contenido que desees agregar en el cuerpo
          ],
        ),
        bottomNavigationBar: BottomIcons(),
      ),
    );
  }
}

class SemiOvalButton extends StatelessWidget {
  final String text;

  const SemiOvalButton({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      height: 40.0, // Ajusta el ancho del botón según tus necesidades
      child: ElevatedButton(
        onPressed: () {
          _showPopup(context, text);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          primary: Colors.white,
        ),
        child: Text(text),
      ),
    );
  }

  void _showPopup(BuildContext context, String buttonText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Botón Presionado'),
          content: Text('Has presionado el botón: $buttonText'),
          actions: <Widget>[
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
