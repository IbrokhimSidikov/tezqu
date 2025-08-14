import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF5F7F9),
              ),
              child: IconButton(
                iconSize: 29,
                icon: Icon(Icons.person),
                color: Colors.black,
                onPressed: () {},
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFF5F7F9),
                ),
                child: IconButton(
                  iconSize: 29,
                  icon: Icon(Icons.notifications),
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(
              top: 16.0, bottom: 16.0, left: 16.0, right: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/icons/card.png', width: 23, height: 23),
                  SizedBox(width: 10),
                  Text('Umumiy to\'lov', style: TextStyle(fontSize: 20)),
                ],
              ),
              SizedBox(height: 0),
              Row(
                children: [
                  Text('\$ 12 345,67',
                      style:
                          TextStyle(fontSize: 53, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF43C19F),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 13.0, right: 13.0, top: 9.0, bottom: 9.0),
                      child: Row(
                        children: [
                          Image.asset('assets/icons/jam_arrow-up.png',
                              width: 23, height: 23),
                          SizedBox(width: 4),
                          Text('To`lovlarim',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF292B2F),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 13.0, right: 13.0, top: 9.0, bottom: 9.0),
                      child:
                          Icon(Icons.favorite, color: Colors.white, size: 35),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFFF5F7F9),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 13.0, right: 13.0, top: 9.0, bottom: 9.0),
                      child: Row(
                        children: [
                          Image.asset('assets/icons/money-bag.png',
                              width: 23, height: 23),
                          SizedBox(width: 5),
                          Text('Kirimlar',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
