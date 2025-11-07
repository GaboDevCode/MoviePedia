import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadMessages() {
    final message = <String> [
      'cargando peliculas...',
      'Espere un momento...',
      'solo un poco mas....',
      'listo , comenzemos......',
    ];
    return Stream.periodic(Duration(milliseconds: 1200), (step) {
      return message[step];
    }).take(message.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          StreamBuilder(
            stream: getLoadMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Text("cargando.......");

              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
