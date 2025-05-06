class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;
  int seaLevel;
  int grndLevel;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp'] as double,
      feelsLike: map['feelsLike'] as double,
      tempMin: map['tempMin'] as double,
      tempMax: map['tempMax'] as double,
      pressure: map['pressure'] as int,
      humidity: map['humidity'] as int,
      seaLevel: map['seaLevel'] as int,
      grndLevel: map['grndLevel'] as int,
    );
  }
}