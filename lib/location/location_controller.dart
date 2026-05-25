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
}


class Filter {
  List<LocationController>filterCities(
      String val,
      List<LocationModel> locations,
      ) {
    return LocationController.where((location) {
      return location.city.toLowerCase().contains(
        val.toLowerCase(),
      );
    }).toList();
  }
}