import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tex_zadacha/inputs/custom_widget.dart';
import 'package:tex_zadacha/inputs/search_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool isAddAdress = false;
  bool isSelected = true;
  Duration duration = const Duration(seconds: 2);

  final dateController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final textController = TextEditingController();
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
                    const Text(("Start date"),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        )),
                    const CustomWidget(
                      hintext: 'Sep 12, 2023',
                      prefixIcon: Icon(Icons.calendar_month),
                    ),
                    const SizedBox(height: 48),
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
                            color: Colors.grey.withOpacity(0.5),
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
                                Tab(
                                  text: 'Add adress',
                                ),
                                Tab(text: 'Select address'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Full name*",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const CustomWidget(
                      hintext: 'Danilev Egor',
                      prefixIcon: Icon(Icons.person),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Email*",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const CustomWidget(
                      hintext: 'egor_zu@email.com',
                      prefixIcon: Icon(Icons.email),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Phone number*",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const CustomWidget(
                      hintext: '+375726014690',
                      prefixIcon: Icon(Icons.call),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Country*",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const CustomWidget(
                      hintext: 'Belarus',
                      prefixIcon: Icon(Icons.place),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "City*",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const CustomWidget(
                      hintext: 'Minsk',
                      prefixIcon: Icon(Icons.domain),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Address line 1*",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const CustomWidget(
                      hintext: 'Derzhinskogo 3b',
                      prefixIcon: Icon(Icons.cancel_schedule_send),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Add address line +",
                      style: TextStyle(
                        color: Color.fromRGBO(234, 86, 13, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Postcode*",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const CustomWidget(
                      hintext: 'Sep 12, 2023',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    const Text(("Recipient adress"),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        )),
                    const SizedBox(height: 16),
                    const CustomWidget(
                      hintext: 'Sep 12, 2023',
                      prefixIcon: Icon(Icons.calendar_month),
                    ),
                    const SizedBox(height: 48),
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
                              dividerColor: Colors.white.withOpacity(0),
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
                        // Expanded(
                        //   child: TabBarView(children:
                        //   if( )),
                        // )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Full name*",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const CustomWidget(
                      hintext: 'Ko Yuri',
                      prefixIcon: Icon(Icons.person),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Email*",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const CustomWidget(
                      hintext: 'yuri@email.com',
                      prefixIcon: Icon(Icons.email),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Phone number*",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const CustomWidget(
                      hintext: '+375294545687',
                      prefixIcon: Icon(Icons.call),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Country*",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const CustomWidget(
                      hintext: 'Italy',
                      prefixIcon: Icon(Icons.place),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "City*",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const CustomWidget(
                      hintext: 'Naple',
                      prefixIcon: Icon(Icons.domain),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Address line 1*",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const CustomWidget(
                      hintext: 'Via Toledo 256',
                      prefixIcon: Icon(Icons.cancel_schedule_send),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Add address line +",
                      style: TextStyle(
                        color: Color.fromRGBO(234, 86, 13, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Postcode*",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const CustomWidget(
                      hintext: '80100',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SearchPage()));
                },
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
