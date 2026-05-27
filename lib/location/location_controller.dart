import 'package:flutter/services.dart';
import 'package:csv/csv.dart';

import 'location_model.dart';

class LocationController {
  List<LocationModel> locations = [];

  Future<void> loadLocations() async {
    String rawData = await rootBundle.loadString(
      //Loading the CSV file
      'assets/in.csv',
    );

    List<List<dynamic>>
    csvTable = //Loads the incoming String CSV data into a list named-csvTable
        //csvToListConverter().convert(rawData);
        csv.decode(rawData); //Converting CSV file into String
    for (int i = 1; i < csvTable.length; i++) {
      //Skips first row which are headers in CSV File

      final row = csvTable[i];

      locations.add(
        LocationModel(city: row[0].toString(), adminName: row[5].toString()),
      );
    }
  }

  List<LocationModel> filterCities(String val) {
    return locations.where((location) {
      return location.city.toLowerCase().contains(val.toLowerCase());
    }).toList();
  }

  final List<Map<String, String>> service = [
    {"image": "assets/images/1000090274.png", "title": "Book Lab Tests"},
    {"image": "assets/images/1000090275.png", "title": "Plan Surgeries"},
    {"image": "assets/images/1000090276.png", "title": "Order Medicines"},
    {"image": "assets/images/1000090277.png", "title": "Buy Subscription"},
  ];

  final List<Map<String, String>> scrollData = [
    {"title": "Dental Care!", "info": "Flat 20% Off", "image": "assets/images/7496520e03291819644f698a032fbb39.jpg"},
    {"title": "Skin Care", "info": "Top Specialists", "image": "assets/images/2413171.png"},
    {"title": "Eye Care", "info": "Avail LASIK Surgery with 15% Off", "image": "assets/images/5717736.png"},
    {"title": "Health Insurance", "info": "Best Insurances curated For You", "image": "assets/images/istockphoto-1131997007-612x612.jpg"},
  ];
}
