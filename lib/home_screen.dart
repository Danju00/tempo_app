import 'package:flutter/material.dart';
import 'package:tempo_app/notifications.dart';
import 'package:tempo_app/profile.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatelessWidget {
  static String id = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 72, 165, 144),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 72, 165, 144),
          title: Text('Tempo-UTT'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Aquí puedes agregar la lógica para la búsqueda
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  OvalButton(
                    text: 'Grupos',
                    color: Color.fromRGBO(128, 128, 128, 0.7),
                  ),
                  OvalButton(
                    text: 'Aulas',
                    color: Color.fromRGBO(128, 128, 128, 0.7),
                  ),
                  OvalButton(
                    text: 'Docentes',
                    color: Color.fromRGBO(128, 128, 128, 0.7),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              CardList(),
              // Aquí puedes agregar contenido adicional al body
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
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notifications()),
              );
            },
            child: Icon(Icons.notifications, color: Colors.white),
          ),
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

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: <Widget>[
        PdfCard(
          pdfUrl:
              'https://drive.google.com/file/d/1bUeZ0e4C3Fv4tIqfpLxwU-bEQAxR0hmH/view?usp=drive_link',
        ),
        PdfCard(
          pdfUrl:
              'https://drive.google.com/file/d/1_r8kXW6O8JwUu2u3vbSuZjCtlqHZP83t/view?usp=drive_link',
        ),
        // Agrega más tarjetas según sea necesario
      ],
    );
  }
}

class PdfCard extends StatelessWidget {
  final String pdfUrl;

  PdfCard({required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          FutureBuilder<PDFDocument>(
            future: PDFDocument.fromURL(pdfUrl),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PDFViewer(document: snapshot.data!);
              } else if (snapshot.hasError) {
                return Text('Error al cargar el PDF');
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
          ElevatedButton.icon(
            onPressed: () async {
              if (await canLaunch(pdfUrl)) {
                await launch(pdfUrl);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('No se pudo abrir el PDF'),
                  ),
                );
              }
            },
            icon: Icon(Icons.download), // Icono de descarga
            label: Text('Descargar PDF'),
          ),
        ],
      ),
    );
  }
}
