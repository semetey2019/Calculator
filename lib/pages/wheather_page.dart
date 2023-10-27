import 'package:flutter/material.dart';
import 'package:tex_zadacha/constants/api_const.dart';
import 'package:dio/dio.dart';
import 'package:tex_zadacha/model.dart';

const List cities = <String>[
  'Саратов',
  'Мурманск',
  'Сочи',
  'Москва',
  'Казань',
  'Омск',
  'Краснодар',
  'Екатеринбург',
  "Новосибирск",
];

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Weather? weather;

  Future<void> fetchData([String? url]) async {
    Dio dio = Dio();
    final response = await dio.get(
      ApiConst.weatherData(url ?? 'Саратов'),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      weather = Weather(
        id: response.data['weather'][0]['id'],
        main: response.data['weather'][0]['main'],
        description: response.data['weather'][0]['description'],
        icon: response.data['weather'][0]['icon'],
        temp: response.data['main']['temp'],
        name: response.data['name'],
      );
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  final _searchController = TextEditingController();
  final FocusNode _focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Weather')),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: weather == null
              ? const CircularProgressIndicator()
              : Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/2023.jpg',
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () async {
                                shouBottom();
                              },
                              icon: const Icon(
                                Icons.location_city,
                                color: Colors.green,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: _searchController,
                          focusNode: _focus,
                          decoration: InputDecoration(
                            hintText: "Search...",
                            hintStyle:
                                const TextStyle(color: Colors.greenAccent),
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.search),
                                color: Colors.greenAccent),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            fillColor: Colors.green,
                            filled: true,
                          ),
                          maxLines: 1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text(
                                '${(weather!.temp - 273.15).toInt()}°',
                                style: const TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.greenAccent),
                              ),
                              Image.network(
                                ApiConst.getIcon(
                                  weather!.icon,
                                  4,
                                ),
                                color: Colors.greenAccent,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: FittedBox(
                            child: Text(
                              weather!.description.replaceAll(' ', '\n'),
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 50,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FittedBox(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                weather!.name,
                                style: const TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 50,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  void shouBottom() async {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.greenAccent,
          ),
          child: ListView.builder(
            itemCount: cities.length,
            itemBuilder: (context, index) {
              final city = cities[index];
              return Card(
                child: ListTile(
                  onTap: () {
                    setState(() {
                      weather = null;
                    });
                    fetchData(city);
                    Navigator.pop(context);
                  },
                  title: Text(
                    '$city',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
