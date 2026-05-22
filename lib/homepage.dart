import 'package:flutter/material.dart';
import 'package:practo/location/location_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          backgroundColor: Color(0x66bfbcfc),
          title: GestureDetector(
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LocationView()),
              );
              if (result != null) {
                setState(() {
                  selectedLocation = result;
                });
              }
            },

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_pin),
                Text(selectedLocation ?? "Select City"),
                Container(
                  padding: EdgeInsets.all(5),
                  //child: DropdownButton(items: items, onChanged: onChanged),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
