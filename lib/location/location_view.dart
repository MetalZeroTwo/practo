import 'package:flutter/material.dart';
import 'package:practo/location/location_controller.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  LocationController controller = LocationController();
  String? selectedLocation;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await controller.loadLocations();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.blueAccent,
          leading: IconButton(
            tooltip: "Close",
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: false,

          title: Text("Enter your city", style: TextStyle(color: Colors.white)),
        ),
      ),

      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: controller.locations.length,
        itemBuilder: (BuildContext context, int index) {
          final location = controller.locations[index];
          return InkWell(
            child: Ink(
              //color: Colors.blueAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        controller.locations.isNotEmpty
                            ? location.city
                            : "Loading...",
                      ),
                      Text(", "),
                      Text(
                        controller.locations.isNotEmpty
                            ? location.adminName
                            : "Loading...",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context, {
                "city": location.city,
                "adminName": location.adminName,
              });
            },
          );
        },
      ),

      //
      // InkWell(
      //   child: Ink(
      //     color: Colors.blueAccent,
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Align(
      //         alignment: AlignmentGeometry.centerLeft,
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             Text(
      //               controller.locations.isNotEmpty
      //                   ? controller.locations[1].city
      //                   : "Loading...",
      //             ),
      //             Text(", "),
      //             Text(
      //               controller.locations.isNotEmpty
      //                   ? controller.locations[1].adminName
      //                   : "Loading...",
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      //   onTap: () {
      //     Navigator.pop(context, {
      //       "city": controller.locations[1].city,
      //       "adminName": controller.locations[1].adminName,
      //     });
      //     //Navigator.pop(context, [controller.locations[1].city,controller.locations[1].adminName]);
      //   },
      // ),
      //
      // InkWell(
      //   child: Ink(
      //     color: Colors.blueAccent,
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Align(
      //         alignment: AlignmentGeometry.centerLeft,
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             Text(
      //               controller.locations.isNotEmpty
      //                   ? controller.locations[0].city
      //                   : "Loading...",
      //             ),
      //             Text(", "),
      //             Text(
      //               controller.locations.isNotEmpty
      //                   ? controller.locations[0].adminName
      //                   : "Loading...",
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      //   onTap: () {
      //     Navigator.pop(context, {
      //       "city": controller.locations[0].city,
      //       "adminName": controller.locations[0].adminName,
      //     });
      //     //Navigator.pop(context, [controller.locations[1].city,controller.locations[1].adminName]);
      //   },
      // ),
    );
  }
}
