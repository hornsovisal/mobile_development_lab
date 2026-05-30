import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        //app bar
        appBar: AppBar(
          //leading in left slide
          leading: Padding(
            padding: EdgeInsets.all(8),
            //a circle image
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
              ),
            ),
          ),
          //title middile
          title: Text("Good Morning Sovisal HORN"),
          //action right
          actions: [
            IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          ],
        ),

        body: Column(
          children: [
            //box search
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),

              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: "Search...",
                ),
              ),
            ),

            //a container banner
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 500,
              width: double.infinity,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://cdn.kiripost.com/static/images/cadt-graduates.2e16d0ba.fill-960x540.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //3 Action Button
            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Action Button",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),

            //3 Collumn with 2 Row of Service
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //1 box
                    Container(
                      margin: EdgeInsets.all(5),
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                        color: const Color.fromARGB(255, 0, 28, 70),
                      ),
                      //Collumn of Icon and Text
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            //a icon
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.access_time_filled_rounded,
                                color: Colors.white,
                              ),
                            ),
                            Center(
                              child: Text(
                                "Schdule",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                        color: const Color.fromARGB(255, 0, 28, 70),
                      ),
                      //Collumn of Icon and Text
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            //a icon
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.assignment_turned_in,
                                color: Colors.white,
                              ),
                            ),
                            Center(
                              child: Text(
                                "Leave",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                        color: const Color.fromARGB(255, 0, 28, 70),
                      ),
                      //Collumn of Icon and Text
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            //a icon
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.menu_book_outlined,
                                color: Colors.white,
                              ),
                            ),
                            Center(
                              child: Text(
                                "Course",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //1 box
                    Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                        color: const Color.fromARGB(255, 0, 28, 70),
                      ),
                      //Collumn of Icon and Text
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            //a icon
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.access_time_filled_rounded,
                                color: Colors.white,
                              ),
                            ),
                            Center(
                              child: Text(
                                "Schdule",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                        color: const Color.fromARGB(255, 0, 28, 70),
                      ),8
                      //Collumn of Icon and Text
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            //a icon
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.assignment_turned_in,
                                color: Colors.white,
                              ),
                            ),
                            Center(
                              child: Text(
                                "Leave",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                        color: const Color.fromARGB(255, 0, 28, 70),
                      ),
                      //Collumn of Icon and Text
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            //a icon
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.menu_book_outlined,
                                color: Colors.white,
                              ),
                            ),
                            Center(
                              child: Text(
                                "Course",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        //bottom nav bar
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.symmetric(vertical: 10),

          //Row that have 3 : Home , Service , Profile
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //Collumn of Icon , and Text
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.home)),
                  Text("Home"),
                ],
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.build)),
                  Text("Service"),
                ],
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.person)),
                  Text("Profile"),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
