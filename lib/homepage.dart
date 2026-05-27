import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practo/location/location_view.dart';
import 'package:practo/location/location_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController carouselController = CarouselController(
    initialItem: 0,
  );

  final LocationController controller = LocationController();
  late Timer _timer;
  int currentIndex = 0;
  String? city;
  String? adminName;
  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      currentIndex++;
      if (currentIndex >= controller.scrollData.length) {
        currentIndex = 0;
      }
      carouselController.animateToItem(
        currentIndex,
        duration: Duration(seconds: 2),
        curve: Curves.easeInOut,
      );
    }
    );
  }

  void dispose() {
    carouselController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    SizedBox(height: 10),
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
        padding: EdgeInsets.only(top: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              color: Colors.white,
              margin: EdgeInsets.all(10),
              elevation: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 1,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [Color(0xFFc9e7ff), Color(0x66bfbcfc)],
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "In-Person Consultation",
                                  softWrap: true,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),

                              SizedBox(width: 10),

                              Image.asset(
                                'assets/images/doctorsymbol.png',
                                height: 80,
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 5),

                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [Color(0xFFc9e7ff), Color(0x66bfbcfc)],
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Video      Consultation",
                                  softWrap: true,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),

                              Image.asset(
                                'assets/images/smartphone.png',
                                height: 80,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Wrap(
                    spacing: 5, //space between the cards
                    runSpacing: 7, //vertical spacing abpve the cards
                    alignment: WrapAlignment.spaceEvenly,
                    children: List.generate(controller.service.length, (index) {
                      return Container(
                        width: 89, //Revisit - width of the cards
                        //height: 90,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              controller.service[index]["image"]!,
                              height: 45,
                            ),

                            Text(
                              controller.service[index]["title"]!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                              softWrap: true,
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            //  Text("HI hello How are you champ!"),

            //Example container as structure for carosuelView.builder.
            // Container(
            //   padding: EdgeInsets.all(25),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(12),
            //     gradient: LinearGradient(
            //       begin: AlignmentGeometry.bottomLeft,
            //       end: AlignmentGeometry.topRight,
            //       colors: [Colors.lightBlueAccent, Colors.blueAccent],
            //     ),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     //crossAxisAlignment: CrossAxisAlignment.end,
            //     children: [
            //       Text("Dental Care" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),),
            //       Text("Flat 20% Off" ,style: TextStyle(fontSize: 18),),
            //     ],
            //   ),
            // ),

            //------------------------------------------
            SizedBox(
              height: 180,
              child: CarouselView.weighted(
                controller: carouselController,

                flexWeights: const [1, 10, 1],
                itemSnapping: true,

                children: controller.scrollData.map((sd) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(15),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,

                        colors: [Colors.lightBlueAccent, Colors.blueAccent],
                      ),
                    ),

                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                sd["title"] ?? "",
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                sd["info"] ?? "",
                                softWrap: true,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 10),

                        Image.asset(
                          sd["image"] ?? "",
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            // SizedBox(
            //   height: 120, //width: 500,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: controller.scrollData.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       final sd = controller.scrollData[index];
            //       return Container(
            //         width: 350,
            //         margin: EdgeInsets.only(right: 10),
            //         padding: EdgeInsets.all(15),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(12),
            //           gradient: LinearGradient(
            //             begin: AlignmentGeometry.bottomLeft,
            //             end: AlignmentGeometry.topRight,
            //             colors: [Colors.lightBlueAccent, Colors.blueAccent],
            //           ),
            //         ),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Expanded(
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                     sd["title"]!,
            //                     style: TextStyle(
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 25,
            //                     ),
            //                   ),
            //                   Text(sd["info"]!, style: TextStyle(fontSize: 18),softWrap: true,),
            //                 ],
            //               ),
            //             ),
            //             Image.asset(sd["image"]!, height: 80,),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
