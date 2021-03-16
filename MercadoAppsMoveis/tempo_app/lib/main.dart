import 'package:flutter/material.dart';
import 'package:tempo_app/screens/home.dart';
import 'package:tempo_app/theme/theme.dart';

void main() {
  runApp(PrevisaoTempo());
}


class PrevisaoTempo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      title: 'Previsão do Tempo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
    );
  }
}
