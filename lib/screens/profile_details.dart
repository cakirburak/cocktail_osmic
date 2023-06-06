import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({super.key});

  @override
  State<ProfileDetailScreen> createState() {
    return _ProfileDetailScreenState();
  }
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(
                      margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 24, 20, 0),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(60),
                                      child: const Image(
                                        alignment: Alignment.topCenter,
                                        image: AssetImage(
                                            'assets/images/blank-profile-picture.webp'),
                                        height: 110,
                                        width: 110,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      height: 28,
                                      width: 28,
                                      child: CircleAvatar(
                                        backgroundColor: const Color.fromARGB(
                                            255, 253, 151, 39),
                                        child: IconButton(
                                          style: ButtonStyle(
                                            iconSize:
                                                MaterialStateProperty.all(22),
                                            padding: MaterialStateProperty.all(
                                              const EdgeInsets.all(0),
                                            ),
                                          ),
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.add,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                child: Text(
                                  'cakirburak',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40)
                        ],
                      ),
                    ),
                  ],
                ),
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
