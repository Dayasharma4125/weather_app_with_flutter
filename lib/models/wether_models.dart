class Weather{
  final String cityname;
  final double temprature;
  final String maincondition;
  Weather({required this.cityname,required this.maincondition,required this.temprature});
  factory Weather.fromJson(Map<String,dynamic> json){
    return Weather(
      cityname:json['name'],
      temprature: json['main']['temp'].toDouble() -273.15,
      maincondition: json['weather'][0]['main'],
    );
  }
} 