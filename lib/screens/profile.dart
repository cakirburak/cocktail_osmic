import 'package:cocktail_osmic/screens/profile_details.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background-pattern-bw.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Color.fromARGB(80, 0, 0, 0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    margin: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(110, 20, 110, 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: const Image(
                              alignment: Alignment.topCenter,
                              image: AssetImage(
                                  'assets/images/blank-profile-picture.webp'),
                              height: 110,
                              width: 110,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 26),
                          child: Text(
                            'cakirburak',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(34, 40, 34, 20),
                          child: Column(
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 4, 80, 4)),
                                icon: Image.asset(
                                  'assets/icons/icons8-favorite-100-orange.png',
                                  width: 40,
                                  height: 40,
                                ),
                                label: const Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Text(
                                      'Favorites',
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.white),
                                    )),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton.icon(
                                onPressed: () {
                                    Navigator.push(context,  MaterialPageRoute(builder: (context) => const ProfileDetailScreen()));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 4, 80, 4),
                                ),
                                icon: Image.asset(
                                  'assets/icons/icons8-user-96-orange.png',
                                  width: 40,
                                  height: 40,
                                ),
                                label: const Padding(
                                    padding: EdgeInsets.fromLTRB(30, 0, 14, 0),
                                    child: Text(
                                      'Profile',
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.white),
                                    )),
                              ),
                              const SizedBox(height: 50),
                              Ink(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(100.0),
                                  onTap: () {
                                    FirebaseAuth.instance.signOut();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Icon(
                                      Icons.logout_rounded,
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 64,
          child: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 253, 151, 39),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 0,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/icons8-to-do-list-100.png',
                  height: 38,
                  width: 38,
                ),
                label: 'Find Cocktail',
                activeIcon: Image.asset(
                  'assets/icons/icons8-to-do-list-100-filled.png',
                  height: 38,
                  width: 38,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/icons8-user-96.png',
                  height: 38,
                  width: 38,
                ),
                label: 'Find Cocktail',
                activeIcon: Image.asset(
                  'assets/icons/icons8-user-96-filled.png',
                  height: 38,
                  width: 38,
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: Image.asset(
                  'assets/icons/icons8-list-100.png',
                  height: 38,
                  width: 38,
                ),
                label: 'Find Cocktail',
                activeIcon: Image.asset(
                  'assets/icons/icons8-list-100-filled.png',
                  height: 38,
                  width: 38,
                ),
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
