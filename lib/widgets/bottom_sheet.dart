import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/empty_screens.dart';
import '../screens/search_screen.dart';
import 'option_widget.dart';

class BottomSheetInfo extends StatefulWidget {
  const BottomSheetInfo({super.key});

  @override
  State<BottomSheetInfo> createState() => _BottomSheetInfoState();
}

class _BottomSheetInfoState extends State<BottomSheetInfo> {
  late TextEditingController _departureController;
  late TextEditingController _arrivalController;

  @override
  void initState() {
    super.initState();
    _departureController = TextEditingController();
    _arrivalController = TextEditingController();
  }

  @override
  void dispose() {
    _departureController.dispose();
    _arrivalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {}, // Define the onClosing function as needed
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            if (_departureController.text.isNotEmpty &&
                _arrivalController.text.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              );
            }
          },
          child: Container(
            color: const Color(0xff3E3F43),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 6,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xff5E5F61),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 15.0),
                    child: Container(
                      width: double.infinity,
                      height: 135,
                      decoration: BoxDecoration(
                        color: const Color(0xff2F3035),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: SvgPicture.asset(
                                  "font/icons/flight.svg",
                                  height: 35,
                                  width: 35,
                                ),
                              ),
                              SizedBox(
                                width: 320,
                                height: 50,
                                child: TextFormField(
                                  controller: _departureController,
                                  decoration: const InputDecoration(
                                    hintText: 'Откуда - Москва',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "SF_Pro_display",
                                      fontSize: 18,
                                    ),
                                    border: OutlineInputBorder(
                                      gapPadding: 0,
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Divider(
                              color: Color(0xff3E3F43),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: SvgPicture.asset(
                                  "font/icons/search.svg",
                                  height: 35,
                                  width: 35,
                                ),
                              ),
                              SizedBox(
                                width: 320,
                                height: 50,
                                child: TextFormField(
                                  controller: _arrivalController,
                                  decoration: InputDecoration(
                                    suffix: SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: SvgPicture.asset(
                                          "font/icons/cancel.svg"),
                                    ),
                                    hintText: 'Куда - Турция',
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "SF_Pro_display",
                                      fontSize: 18,
                                    ),
                                    border: const OutlineInputBorder(
                                      gapPadding: 0,
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OptionItem(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Page1()),
                          );
                        },
                        color: const Color(0xff015905),
                        iconPath: "font/icons/option1.svg",
                        label: "Сложный\nмаршрут",
                      ),
                      OptionItem(
                        onTap: () {
                          setState(() {
                            _arrivalController.text = "Куда угодно";
                          });
                        },
                        color: const Color(0xff4C95FE),
                        iconPath: "font/icons/option2.svg",
                        label: "Куда угодно",
                      ),
                      OptionItem(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Page2()),
                          );
                        },
                        color: const Color(0xff275794),
                        iconPath: "font/icons/option3.svg",
                        label: "Выходные",
                      ),
                      OptionItem(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Page3()),
                          );
                        },
                        color: const Color(0xffFF0000),
                        iconPath: "font/icons/option4.svg",
                        label: "Горячие\nбилеты",
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15),
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xff2F3035),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          ListTile(
                            visualDensity: VisualDensity.compact,
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "font/images/turkey.jpg",
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            title: const Text(
                              "Стамбул",
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: const Text(
                              "Популярное направление",
                              style: TextStyle(
                                color: Color(0xff5E5F61),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(
                              color: Color(0xff5E5F61),
                            ),
                          ),
                          ListTile(
                            visualDensity: VisualDensity.compact,
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "font/images/sochi.jpg",
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            title: const Text(
                              "Сочи",
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: const Text(
                              "Популярное направление",
                              style: TextStyle(
                                color: Color(0xff5E5F61),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(
                              color: Color(0xff5E5F61),
                            ),
                          ),
                          ListTile(
                            visualDensity: VisualDensity.compact,
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "font/images/phuket.jpg",
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            title: const Text(
                              "Пхукет",
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: const Text(
                              "Популярное направление",
                              style: TextStyle(color: Color(0xff5E5F61)),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(
                              color: Color(0xff5E5F61),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
