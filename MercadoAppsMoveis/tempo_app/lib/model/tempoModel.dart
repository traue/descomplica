class TempoData {
  final double temp;
  final double tempMax;
  final double tempMin;
  final String descTemp;
  final String icone;
  final int umidade;

  TempoData(
      {this.temp,
      this.tempMax,
      this.tempMin,
      this.descTemp,
      this.icone,
      this.umidade});

  factory TempoData.fromJson(Map<String, dynamic> json) {

    String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

    return TempoData(
      temp: json['main']['temp'].toDouble(),
      tempMax: json['main']['temp_max'].toDouble(),
      tempMin: json['main']['temp_min'].toDouble(),
      descTemp: capitalize(json['weather'][0]['description']),
      icone: json['weather'][0]['icon'],
      umidade: json['main']['humidity'].toInt()
    );
  }

}
