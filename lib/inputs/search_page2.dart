import 'package:flutter/material.dart';
import 'package:tex_zadacha/inputs/inputs.dart';
import 'package:tex_zadacha/inputs/search_page.dart';

class SearchPage2 extends StatefulWidget {
  const SearchPage2({super.key});

  @override
  State<SearchPage2> createState() => _SearchPage2State();
}

class _SearchPage2State extends State<SearchPage2> {
  bool isAddAdress = true;
  bool isSelected = true;
  Duration duration = const Duration(seconds: 2);
  Future<void> changeMode(int value) async {
    if (value == 0) {
      setState(() {
        isSelected = true;
      });
      await Future.delayed(
        const Duration(seconds: 2),
      );
      setState(() {
        isAddAdress = true;
      });
    } else {
      setState(() {
        isSelected = false;
      });
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        isAddAdress = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    // Future<void> changeMode(int value) async {
    //   if (value == 0) {
    //     setState(() {
    //       isSelected = true;
    //     });
    //     await Future.delayed(
    //       const Duration(seconds: 2),
    //     );
    //     setState(() {
    //       isAddAdress = true;
    //     });
    //   } else {
    //     setState(() {
    //       isSelected = false;
    //     });
    //     await Future.delayed(const Duration(seconds: 2));
    //     setState(() {
    //       isAddAdress = false;
    //     });
    //   }
    // }

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tab Bar",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                LinearProgressIndicator(
                  value: 23,
                ),
                Material(
                  child: Container(
                    height: 70,
                    color: Colors.white,
                    child: TabBar(
                      labelColor: Colors.white,
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.only(
                          top: 10, left: 10, right: 10, bottom: 10),
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.grey,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.red),
                      tabs: [
                        Tab(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Add address",
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Selected adress",
                              ),
                            ),
                          ),
                        ),

                        // body: Column(children: [
                        //   Container(
                        //     color: Colors.white,
                        //     child: Padding(
                        //       padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: [
                        //           const Text(
                        //             "Recipient adress",
                        //             style: TextStyle(
                        //               fontSize: 16,
                        //               fontWeight: FontWeight.w700,
                        //             ),
                        //           ),
                        //           const SizedBox(height: 16),
                        //           // Column(
                        //           //   children: [
                        //           //     Row(
                        //           //       children: [
                        //           //         GestureDetector(
                        //           //           onTap: () {
                        //           //             _onContainer1Pressed();
                        //           //           },
                        //           //           child: Container(
                        //           //             width: width * 0.44,
                        //           //             height: height * 0.056,
                        //           //             decoration: BoxDecoration(
                        //           //                 color: container1Active
                        //           //                     ? Colors.red
                        //           //                     : Colors.grey,
                        //           //                 borderRadius: BorderRadius.circular(20)),
                        //           //             child: const Padding(
                        //           //               padding: EdgeInsets.fromLTRB(20, 9, 20, 0),
                        //           //               child: Text("Add adress",
                        //           //                   textAlign: TextAlign.center,
                        //           //                   style: TextStyle(
                        //           //                       fontSize: 16,
                        //           //                       fontWeight: FontWeight.w600,
                        //           //                       color: Colors.white)),
                        //           //             ),
                        //           //           ),
                        //           //         ),
                        //           //         const SizedBox(width: 8),
                        //           //         GestureDetector(
                        //           //           onTap: () {
                        //           //             _onContainer2Pressed();
                        //           //           },
                        //           //           child: Container(
                        //           //             width: width * 0.44,
                        //           //             height: height * 0.056,
                        //           //             decoration: BoxDecoration(
                        //           //                 color: container2Active
                        //           //                     ? Colors.red
                        //           //                     : Colors.grey,
                        //           //                 borderRadius: BorderRadius.circular(20)),
                        //           //             child: const Padding(
                        //           //               padding: EdgeInsets.fromLTRB(20, 9, 20, 0),
                        //           //               child: Text("Select address",
                        //           //                   textAlign: TextAlign.center,
                        //           //                   style: TextStyle(
                        //           //                       fontSize: 16,
                        //           //                       fontWeight: FontWeight.w600,
                        //           //                       color: Colors.white)),
                        //           //             ),
                        //           //           ),
                        //           //         ),
                        //           //       ],
                        //           //     ),
                        //           Container(
                        //             width: width * 0.90,
                        //             height: 45,
                        //             decoration: BoxDecoration(
                        //               color: Colors.grey[200],
                        //               borderRadius: BorderRadius.circular(30),
                        //             ),
                        //             child: DefaultTabController(
                        //               length: 2,
                        //               child: TabBar(
                        //                 labelPadding: const EdgeInsets.fromLTRB(10, 5, 5, 1),
                        //                 indicatorSize: TabBarIndicatorSize.tab,
                        //                 indicator: BoxDecoration(
                        //                   color: Colors.red,
                        //                   borderRadius: BorderRadius.circular(30),
                        //                 ),
                        //                 onTap: ((value) async {
                        //                   await changeMode(value);
                        //                 }),
                        //                 labelStyle: const TextStyle(
                        //                     fontSize: 16, fontWeight: FontWeight.bold),
                        //                 unselectedLabelColor: Colors.grey[400],
                        //                 labelColor: Colors.white,
                        //                 tabs: const [
                        //                   Tab(text: 'Add adress'),
                        //                   Tab(text: 'Select address'),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //           const SizedBox(height: 20),
                        //           TextField(
                        //             decoration: InputDecoration(
                        //               hintText: "Search...",
                        //               prefixIcon: const Icon(Icons.search),
                        //               contentPadding: const EdgeInsets.symmetric(vertical: 12),
                        //               border: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(8),
                        //               ),
                        //             ),
                        //           ),
                        //           const SizedBox(height: 20),
                        //           Container(
                        //             width: width * 0.9,
                        //             height: height * 0.12,
                        //             decoration: BoxDecoration(
                        //                 color: Colors.black,
                        //                 borderRadius: BorderRadius.circular(20)),
                        //             child: Padding(
                        //               padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
                        //               child: Column(
                        //                 crossAxisAlignment: CrossAxisAlignment.start,
                        //                 mainAxisAlignment: MainAxisAlignment.start,
                        //                 children: [
                        //                   Row(
                        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                     children: [
                        //                       const Text("Ko Yuri",
                        //                           style: TextStyle(
                        //                               fontSize: 14,
                        //                               fontWeight: FontWeight.w600,
                        //                               color: Colors.white)),
                        //                       Image.asset("assets/1.png")
                        //                     ],
                        //                   ),
                        //                   const SizedBox(height: 10),
                        //                   const Text("Italy, Naple, Via Toledo 256, 220069",
                        //                       style: TextStyle(
                        //                           fontSize: 14,
                        //                           fontWeight: FontWeight.w400,
                        //                           color: Colors.white)),
                        //                 ],
                        //               ),
                        // ),
                        //   ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListView.builder(
                        padding: const EdgeInsets.all(15),
                        itemCount: 20,
                        // separatorBuilder: (BuildContext context, int index) =>
                        // const Divider(),
                        itemBuilder: (context, v) {
                          return ListTile(
                            onTap: () {
                              _adAdressInput(context);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (_) => InputPage()));
                            },
                            title: Text("search results "),
                          );
                        },
                      ),
                      ListView.separated(
                        padding: const EdgeInsets.all(15),
                        itemCount: 20,
                        separatorBuilder: (BuildContext context, v) =>
                            const Divider(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SearchPage()));
                            },
                            title: Text("Status List "),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  _adAdressInput(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Ordering",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            )),
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back_ios,
          weight: 8,
          size: 22,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Step 1",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Sender details",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        Container(
                          width: width * 0.90,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: DefaultTabController(
                            length: 2,
                            child: TabBar(
                              labelPadding:
                                  const EdgeInsets.fromLTRB(10, 5, 5, 1),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              onTap: ((value) async {
                                await changeMode(value);
                              }),
                              labelStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              unselectedLabelColor: Colors.grey[400],
                              labelColor: Colors.white,
                              tabs: const [
                                Tab(text: 'Add adress'),
                                Tab(text: 'Select address'),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Search...",
                            prefixIcon: const Icon(Icons.search),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: width * 0.9,
                          height: height * 0.12,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Denilev Egor",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                    Image.asset("assets/1.png")
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                    "Belarus, Minsk, Derzhinskogo 3b, 80100",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Next step",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 1,
                  backgroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 55),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
