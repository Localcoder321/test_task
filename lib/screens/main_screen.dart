import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task/screens/hotels_screen.dart';
import 'package:test_task/screens/profile_screen.dart';
import 'package:test_task/screens/short_distance_screen.dart';
import 'package:test_task/screens/subscription_screen.dart';

import '../models/offer.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/offer_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _currentIndex = 0;
  List<Offer> _offers = [];

  TextEditingController _departureController = TextEditingController();
  final TextEditingController _arrivalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    fetchData();
    _loadFromCache().then((value) {
      _departureController = TextEditingController(text: value);
    });
  }

  Future<String> _loadFromCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("departure") ?? '';
  }

  void _saveToCache(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _departureController.dispose();
    _arrivalController.dispose();
    super.dispose();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        "https://run.mocky.io/v3/00727197-24ae-48a0-bcb3-63eb35d7a9de"));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final offersData = jsonData['offers'];
      setState(() {
        _offers = List<Offer>.from(
          offersData.map(
            (offer) => Offer.fromJson(offer),
          ),
        );
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.flight),
            label: "Авиабилеты",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bed),
            label: "Отели",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place_outlined),
            label: "Короче",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Подписки",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Профиль",
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 10),
                    child: Text(
                      "Поиск дешевых\nавиабилетов",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xffD9D9D9),
                        fontSize: 30,
                        fontFamily: "SF_Pro_display",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40.0, horizontal: 20),
                    child: SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: ColoredBox(
                          color: const Color(0xff2F3035),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext) =>
                                          const BottomSheetInfo());
                                },
                                child: Container(
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: const Color(0xff3E3F43),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      SvgPicture.asset(
                                        "font/icons/search.svg",
                                        height: 32,
                                        width: 32,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const SizedBox(
                                        width: 270,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 15),
                                            Text(
                                              "Откуда - Москва",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: "SF_Pro_display",
                                                  fontSize: 18,
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              "Куда - Турция",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: "SF_Pro_display",
                                                  fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 125.0),
                    child: Text(
                      "Музыкально отлететь",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: "SF_Pro_display",
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: _offers.map((offer) {
                      return OfferItem(offer: offer);
                    }).toList()),
                  )
                ],
              ),
            ),
          ),
          const HotelPage(),
          const ShortDistancePage(),
          const SubscriptionPage(),
          const ProfilePage(),
        ],
      ),
    );
  }
}
