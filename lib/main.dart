// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       title: 'Flutter Demo',
//       theme: CupertinoThemeData(
//         primaryColor: const Color.fromARGB(255, 201, 243, 123),
//       ),
//       home: Homepage(),
//     );
//   }
// }

// class Homepage extends StatelessWidget {
//   const Homepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CupertinoNavigationBar.large(
//         largeTitle: Text('Profile', style: TextStyle(color: Colors.blue)),
//       ),
//       body: ListView(
//         children: [
//           ListTile(
//             leading: CircleAvatar(child: Icon(Icons.accessibility_outlined)),
//             title: Text('Alex'),
//             subtitle: Text('Senior Engineer'),
//           ),ListTile(
//             leading: CircleAvatar(child: Icon(Icons.accessibility_outlined)),
//             title: Text('Alex'),
//             subtitle: Text('Senior Engineer'),
//           ),
//           Card(
//             color: Colors.blueGrey,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   CircleAvatar(child: Icon(Icons.access_time_outlined)),
//                   SizedBox(
//                     width: MediaQuery.sizeOf(context).width - 80,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8.0),
//                           child: Text(
//                             'Alex',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 18,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 11.0),
//                           child: Text('senior engineer'),
//                         ),
//                         SizedBox(
//                           width: MediaQuery.sizeOf(context).width,
//                           child: Column(),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});


//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
    
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       appBar: AppBar(
       
//         title: Text(widget.title),
//       ),
//       body: Center(
        
//         child: Column(
          
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Materi PM',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    DetailScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Detail"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// ------------------ HOME SCREEN -------------------
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: ListView(
        children: [
         ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              "https://i2.wp.com/blog.tripcetera.com/id/wp-content/uploads/2020/10/Danau-Toba-edited.jpg", 
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
            return Center(child: CircularProgressIndicator());
           },
            errorBuilder: (context, error, stackTrace) {
            return Center(child: Icon(Icons.broken_image, size: 50));
            },
          ),
        ),

          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            padding: EdgeInsets.all(8),
            children: List.generate(6, (index) {
              return Card(
                child: Center(
                  child: Text("Item ${index + 1}"),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

// ------------------ DETAIL SCREEN -------------------
class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Screen")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              "https://picsum.photos/500/250",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: List.generate(5, (index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.article),
                      title: Text("Beberapa detail ${index + 1}"),
                      subtitle: Text("website ini di buat oleh siswa SMK Taruna Bhakti"),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ------------------ PROFILE SCREEN -------------------
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Screen")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(50),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("https://i1.sndcdn.com/artworks-000123105997-xrcnay-t500x500.jpg"),
                ),
                title: Text("Satrio Nabil Azzami"),
                subtitle: Text("081283121719"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.settings),
                Icon(Icons.history),
                Icon(Icons.logout),
              ],
            ),
            Column(
              children: List.generate(3, (index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Icon(Icons.check)),
                    title: Text("Aktivitas ${index + 1}"),
                    subtitle: Text("Deskripsi aktivitas."),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp())
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//    return MaterialApp(
//     title: 'UI Example',
//     theme: ThemeData(primarySwatch: Colors.Blue),
//     home: MainScreen(),
//    );
//   }
// }

// class MainScreen extends StatefulWidget {
//   @override 
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;

//   final List<Widget> _screens = [
//     HomeScreen(),
//     DetailScreen(),
//     ProfileScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: Icon(Icons.info), label: "Detail"),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

// // Home 
// class HomeScreen extends StatelessWidget {

// }

// class DetailScreen extends StatelessWidget {
  
// }

// class ProfileScreen extends StatelessWidget {
  
// }
