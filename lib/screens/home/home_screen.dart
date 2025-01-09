import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  String userName = '김장호';
  String userLocal = '제주특별자치도';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Row(
                        children: [
                          Icon(
                              CupertinoIcons.profile_circled,
                              size: 50,
                              color:Colors.white
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '김장호',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                              Text(
                                '제주특별자치도',
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed:null,
                          icon:Icon(
                              size:50,
                              Icons.menu_sharp,
                              color:Colors.white
                          )
                    )
                  ],
                ),
                ],
              )
            ),
            Divider(
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}