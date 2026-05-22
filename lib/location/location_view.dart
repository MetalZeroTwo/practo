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
          backgroundColor: Colors.redAccent,
          leading: IconButton(
            tooltip: "Close",
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          leadingWidth: 20,
          centerTitle: false,
          title: Text("Enter your city", style: TextStyle(color: Colors.white)),
        ),
      ),

      body: Column(
        //spacing: 10,
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: Ink(
              color: Colors.blueAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text("oooooonnnnnnneeeeeee"),
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          // InkWell(
          //   child: Ink(
          //     color: Colors.blueAccent,
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Align(
          //         alignment: AlignmentGeometry.centerLeft,
          //         child: Text(),
          //       ),
          //     ),
          //   ),
          //   onTap: () {
          //     Navigator.pop(context,LocationController());
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
          //         child: Text("oooooonnnnnnneeeeeee"),
          //       ),
          //     ),
          //   ),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          //
          // Container(
          //   padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     shape: BoxShape.rectangle,
          //     color: Colors.blueAccent,
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: Text("tttttttwwwwwwwwwooooooooo"),
          // ),
          //
          // Container(
          //   padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     shape: BoxShape.rectangle,
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: Text("tttthhhhhrrrreeeeee"),
          // ),
        ],
      ),
    );
  }
}
