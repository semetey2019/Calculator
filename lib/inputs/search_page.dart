import 'package:flutter/material.dart';
import 'package:tex_zadacha/inputs/inputs.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isAddAdress = true;
  bool isSelected = true;
  Duration duration = const Duration(seconds: 2);

  bool container1Active = true;
  bool container2Active = true;

  void _onContainer1Pressed() {
    if (container2Active) {
      setState(() {
        container1Active = !container1Active;
        container2Active = !container2Active;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const InputPage()),
      );
    }
  }

  void _onContainer2Pressed() {
    if (container1Active) {
      setState(() {
        container2Active = !container2Active;
        container1Active = !container1Active;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SearchPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Ordering",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            )),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            weight: 8,
            size: 22,
          ),
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
