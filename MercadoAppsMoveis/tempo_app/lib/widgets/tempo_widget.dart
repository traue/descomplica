import 'package:flutter/material.dart';
import 'package:tempo_app/model/tempoModel.dart';


class Tempo extends StatelessWidget {

  final TempoData temperatura;

  Tempo({Key key, @required this.temperatura}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          'http://openweathermap.org/img/wn/${temperatura.icone}.png',
          fit: BoxFit.fill,
          width: 80.0,
        ),
        Text(
          '${temperatura.temp.toStringAsFixed(0)} ºC',
          style: TextStyle(fontSize: 50.0),
        ),
        Text(
          temperatura.descTemp,
          style: TextStyle(fontSize: 30.0),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          "Min. do dia: ${temperatura.tempMin.toStringAsFixed(0)}",
          style: TextStyle(fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
        Text(
          "Max. do dia: ${temperatura.tempMax.toStringAsFixed(0)}",
          style: TextStyle(fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
        Text(
          "Umidade do ar: ${temperatura.umidade.toString()}%"
        )
      ],
    );
  }
}
