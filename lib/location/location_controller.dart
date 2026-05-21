import 'package:flutter/services.dart';
import 'package:csv/csv.dart';

import 'location_model.dart';

class LocationController {

  List<LocationModel> locations = [];

  Future<void> loadLocations() async {

    String rawData = await rootBundle.loadString(
      'lib/location/data/in.csv',
    );

    List<List<dynamic>> csvTable =
    //csvToListConverter().convert(rawData);
    csv.decode(rawData);
    for (int i = 1; i < csvTable.length; i++) {

      final row = csvTable[i];

      locations.add(
        LocationModel(
          city: row[0].toString(),
          adminName: row[1].toString(),
        ),
      );
    }
  }
}