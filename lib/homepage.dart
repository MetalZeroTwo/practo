import 'package:flutter/material.dart';
import 'package:practo/location/location_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? city;
  String? adminName;
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
                  city = result["city"];
                  adminName = result["adminName"];
                });
              }
            },

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on_sharp, applyTextScaling: true, size: 30),
                SizedBox(width: 5),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text(city ?? "Select City!")],
                    ),
                    Text(adminName ?? "", style: TextStyle(fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              //Cards below app bar
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Container(
                        // padding: EdgeInsets.only(
                        //   top: 10,
                        //   bottom: 10,
                        //   left: 10,
                        //   right: 10,
                        // ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.lightBlueAccent,
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Color(0xFFc9e7ff), Color(0x66bfbcfc)],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "In Person",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              softWrap: true,
                            ),
                            Image.asset(
                              'assets/images/smartphone.png',
                              height: 90,
                              //width: 20,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),

                    Flexible(
                      child: Container(
                        // padding: EdgeInsets.only(
                        //   top: 10,
                        //   bottom: 10,
                        //   left: 10,
                        //   right: 10,
                        // ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.lightBlueAccent,
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Color(0xFFc9e7ff), Color(0x66bfbcfc)],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "In",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              softWrap: true,
                            ),
                            Image.asset(
                              'assets/images/smartphone.png',
                              height: 90,
                              //width: 20,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
